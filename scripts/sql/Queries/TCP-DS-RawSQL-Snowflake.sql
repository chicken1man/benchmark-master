use warehouse demo;
use schema demo.tpcds_sf10tcl;

-- TPC-DS_query2
with wscs as
 (select sold_date_sk
        ,sales_price
  from  (select ws_sold_date_sk sold_date_sk
              ,ws_ext_sales_price sales_price
        from web_sales 
        union all
        select cs_sold_date_sk sold_date_sk
              ,cs_ext_sales_price sales_price
        from catalog_sales) x ),
 wswscs as 
 (select d_week_seq,
        sum(case when (d_day_name='Sunday') then sales_price else null end) sun_sales,
        sum(case when (d_day_name='Monday') then sales_price else null end) mon_sales,
        sum(case when (d_day_name='Tuesday') then sales_price else  null end) tue_sales,
        sum(case when (d_day_name='Wednesday') then sales_price else null end) wed_sales,
        sum(case when (d_day_name='Thursday') then sales_price else null end) thu_sales,
        sum(case when (d_day_name='Friday') then sales_price else null end) fri_sales,
        sum(case when (d_day_name='Saturday') then sales_price else null end) sat_sales
 from wscs
     ,date_dim
 where d_date_sk = sold_date_sk
 group by d_week_seq)
 select d_week_seq1
       ,round(sun_sales1/sun_sales2,2)
       ,round(mon_sales1/mon_sales2,2)
       ,round(tue_sales1/tue_sales2,2)
       ,round(wed_sales1/wed_sales2,2)
       ,round(thu_sales1/thu_sales2,2)
       ,round(fri_sales1/fri_sales2,2)
       ,round(sat_sales1/sat_sales2,2)
 from
 (select wswscs.d_week_seq d_week_seq1
        ,sun_sales sun_sales1
        ,mon_sales mon_sales1
        ,tue_sales tue_sales1
        ,wed_sales wed_sales1
        ,thu_sales thu_sales1
        ,fri_sales fri_sales1
        ,sat_sales sat_sales1
  from wswscs,date_dim 
  where date_dim.d_week_seq = wswscs.d_week_seq and
        d_year = 2000) y,
 (select wswscs.d_week_seq d_week_seq2
        ,sun_sales sun_sales2
        ,mon_sales mon_sales2
        ,tue_sales tue_sales2
        ,wed_sales wed_sales2
        ,thu_sales thu_sales2
        ,fri_sales fri_sales2
        ,sat_sales sat_sales2
  from wswscs
      ,date_dim 
  where date_dim.d_week_seq = wswscs.d_week_seq and
        d_year = 2000+1) z
 where d_week_seq1=d_week_seq2-53
 order by d_week_seq1;
 
 -- TPC-DS_query4
with year_total as (
 select c_customer_id customer_id
       ,c_first_name customer_first_name
       ,c_last_name customer_last_name
       ,c_preferred_cust_flag customer_preferred_cust_flag
       ,c_birth_country customer_birth_country
       ,c_login customer_login
       ,c_email_address customer_email_address
       ,d_year dyear
       ,sum(((ss_ext_list_price-ss_ext_wholesale_cost-ss_ext_discount_amt)+ss_ext_sales_price)/2) year_total
       ,'s' sale_type
 from customer
     ,store_sales
     ,date_dim
 where c_customer_sk = ss_customer_sk
   and ss_sold_date_sk = d_date_sk
 group by c_customer_id
         ,c_first_name
         ,c_last_name
         ,c_preferred_cust_flag
         ,c_birth_country
         ,c_login
         ,c_email_address
         ,d_year
 union all
 select c_customer_id customer_id
       ,c_first_name customer_first_name
       ,c_last_name customer_last_name
       ,c_preferred_cust_flag customer_preferred_cust_flag
       ,c_birth_country customer_birth_country
       ,c_login customer_login
       ,c_email_address customer_email_address
       ,d_year dyear
       ,sum((((cs_ext_list_price-cs_ext_wholesale_cost-cs_ext_discount_amt)+cs_ext_sales_price)/2) ) year_total
       ,'c' sale_type
 from customer
     ,catalog_sales
     ,date_dim
 where c_customer_sk = cs_bill_customer_sk
   and cs_sold_date_sk = d_date_sk
 group by c_customer_id
         ,c_first_name
         ,c_last_name
         ,c_preferred_cust_flag
         ,c_birth_country
         ,c_login
         ,c_email_address
         ,d_year
union all
 select c_customer_id customer_id
       ,c_first_name customer_first_name
       ,c_last_name customer_last_name
       ,c_preferred_cust_flag customer_preferred_cust_flag
       ,c_birth_country customer_birth_country
       ,c_login customer_login
       ,c_email_address customer_email_address
       ,d_year dyear
       ,sum((((ws_ext_list_price-ws_ext_wholesale_cost-ws_ext_discount_amt)+ws_ext_sales_price)/2) ) year_total
       ,'w' sale_type
 from customer
     ,web_sales
     ,date_dim
 where c_customer_sk = ws_bill_customer_sk
   and ws_sold_date_sk = d_date_sk
 group by c_customer_id
         ,c_first_name
         ,c_last_name
         ,c_preferred_cust_flag
         ,c_birth_country
         ,c_login
         ,c_email_address
         ,d_year
         )
  select  
                  t_s_secyear.customer_id
                 ,t_s_secyear.customer_first_name
                 ,t_s_secyear.customer_last_name
                 ,t_s_secyear.customer_login
 from year_total t_s_firstyear
     ,year_total t_s_secyear
     ,year_total t_c_firstyear
     ,year_total t_c_secyear
     ,year_total t_w_firstyear
     ,year_total t_w_secyear
 where t_s_secyear.customer_id = t_s_firstyear.customer_id
   and t_s_firstyear.customer_id = t_c_secyear.customer_id
   and t_s_firstyear.customer_id = t_c_firstyear.customer_id
   and t_s_firstyear.customer_id = t_w_firstyear.customer_id
   and t_s_firstyear.customer_id = t_w_secyear.customer_id
   and t_s_firstyear.sale_type = 's'
   and t_c_firstyear.sale_type = 'c'
   and t_w_firstyear.sale_type = 'w'
   and t_s_secyear.sale_type = 's'
   and t_c_secyear.sale_type = 'c'
   and t_w_secyear.sale_type = 'w'
   and t_s_firstyear.dyear =  2001
   and t_s_secyear.dyear = 2001+1
   and t_c_firstyear.dyear =  2001
   and t_c_secyear.dyear =  2001+1
   and t_w_firstyear.dyear = 2001
   and t_w_secyear.dyear = 2001+1
   and t_s_firstyear.year_total > 0
   and t_c_firstyear.year_total > 0
   and t_w_firstyear.year_total > 0
   and case when t_c_firstyear.year_total > 0 then t_c_secyear.year_total / t_c_firstyear.year_total else null end
           > case when t_s_firstyear.year_total > 0 then t_s_secyear.year_total / t_s_firstyear.year_total else null end
   and case when t_c_firstyear.year_total > 0 then t_c_secyear.year_total / t_c_firstyear.year_total else null end
           > case when t_w_firstyear.year_total > 0 then t_w_secyear.year_total / t_w_firstyear.year_total else null end
 order by t_s_secyear.customer_id
         ,t_s_secyear.customer_first_name
         ,t_s_secyear.customer_last_name
         ,t_s_secyear.customer_login
limit 100;

-- TPC-DS_query13
select avg(ss_quantity)
       ,avg(ss_ext_sales_price)
       ,avg(ss_ext_wholesale_cost)
       ,sum(ss_ext_wholesale_cost)
 from store_sales
     ,store
     ,customer_demographics
     ,household_demographics
     ,customer_address
     ,date_dim
 where s_store_sk = ss_store_sk
 and  ss_sold_date_sk = d_date_sk and d_year = 2001
 and((ss_hdemo_sk=hd_demo_sk
  and cd_demo_sk = ss_cdemo_sk
  and cd_marital_status = 'S'
  and cd_education_status = '4 yr Degree'
  and ss_sales_price between 100.00 and 150.00
  and hd_dep_count = 3   
     )or
     (ss_hdemo_sk=hd_demo_sk
  and cd_demo_sk = ss_cdemo_sk
  and cd_marital_status = 'D'
  and cd_education_status = 'Advanced Degree'
  and ss_sales_price between 50.00 and 100.00   
  and hd_dep_count = 1
     ) or 
     (ss_hdemo_sk=hd_demo_sk
  and cd_demo_sk = ss_cdemo_sk
  and cd_marital_status = 'M'
  and cd_education_status = '2 yr Degree'
  and ss_sales_price between 150.00 and 200.00 
  and hd_dep_count = 1  
     ))
 and((ss_addr_sk = ca_address_sk
  and ca_country = 'United States'
  and ca_state in ('MS', 'TX', 'NC')
  and ss_net_profit between 100 and 200  
     ) or
     (ss_addr_sk = ca_address_sk
  and ca_country = 'United States'
  and ca_state in ('TN', 'WA', 'NE')
  and ss_net_profit between 150 and 300  
     ) or
     (ss_addr_sk = ca_address_sk
  and ca_country = 'United States'
  and ca_state in ('MA', 'OR', 'UT')
  and ss_net_profit between 50 and 250  
     ));

-- TPC-DS_query15
select  ca_zip
       ,sum(cs_sales_price)
 from catalog_sales
     ,customer
     ,customer_address
     ,date_dim
 where cs_bill_customer_sk = c_customer_sk
  and c_current_addr_sk = ca_address_sk 
  and ( substring(ca_zip,1,5) in ('85669', '86197','88274','83405','86475',
                                   '85392', '85460', '80348', '81792')
        or ca_state in ('CA','WA','GA')
        or cs_sales_price > 500)
  and cs_sold_date_sk = d_date_sk
  and d_qoy = 1 and d_year = 2001
 group by ca_zip
 order by ca_zip ASC NULLS FIRST
 limit 100;
 
 -- TPC-DS_query19
select  i_brand_id brand_id, i_brand brand, i_manufact_id, i_manufact,
  sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item,customer,customer_address,store
 where d_date_sk = ss_sold_date_sk
   and ss_item_sk = i_item_sk
   and i_manager_id=8
   and d_moy=11
   and d_year=1999
   and ss_customer_sk = c_customer_sk 
   and c_current_addr_sk = ca_address_sk
   and substr(ca_zip,1,5) <> substr(s_zip,1,5) 
   and ss_store_sk = s_store_sk 
 group by i_brand
      ,i_brand_id
      ,i_manufact_id
      ,i_manufact
 order by ext_price desc
         ,i_brand
         ,i_brand_id
         ,i_manufact_id
         ,i_manufact
limit 100;

-- TPC-DS_query26
select  i_item_id, 
        avg(cs_quantity) agg1,
        avg(cs_list_price) agg2,
        avg(cs_coupon_amt) agg3,
        avg(cs_sales_price) agg4 
 from catalog_sales, customer_demographics, date_dim, item, promotion
 where cs_sold_date_sk = d_date_sk and
       cs_item_sk = i_item_sk and
       cs_bill_cdemo_sk = cd_demo_sk and
       cs_promo_sk = p_promo_sk and
       cd_gender = 'M' and 
       cd_marital_status = 'M' and
       cd_education_status = 'College' and
       (p_channel_email = 'N' or p_channel_event = 'N') and
       d_year = 2000 
 group by i_item_id
 order by i_item_id
 limit 100;
 
 -- TPC-DS_query33
with ss as (
 select
          i_manufact_id,sum(ss_ext_sales_price) total_sales
 from
  store_sales,
  date_dim,
         customer_address,
         item
 where
         i_manufact_id in (select
  i_manufact_id
from
 item
where i_category in ('Electronics'))
 and     ss_item_sk              = i_item_sk
 and     ss_sold_date_sk         = d_date_sk
 and     d_year                  = 1999
 and     d_moy                   = 7
 and     ss_addr_sk              = ca_address_sk
 and     ca_gmt_offset           = -5 
 group by i_manufact_id),
 cs as (
 select
          i_manufact_id,sum(cs_ext_sales_price) total_sales
 from
  catalog_sales,
  date_dim,
         customer_address,
         item
 where
         i_manufact_id               in (select
  i_manufact_id
from
 item
where i_category in ('Electronics'))
 and     cs_item_sk              = i_item_sk
 and     cs_sold_date_sk         = d_date_sk
 and     d_year                  = 1999
 and     d_moy                   = 7
 and     cs_bill_addr_sk         = ca_address_sk
 and     ca_gmt_offset           = -5 
 group by i_manufact_id),
 ws as (
 select
          i_manufact_id,sum(ws_ext_sales_price) total_sales
 from
  web_sales,
  date_dim,
         customer_address,
         item
 where
         i_manufact_id               in (select
  i_manufact_id
from
 item
where i_category in ('Electronics'))
 and     ws_item_sk              = i_item_sk
 and     ws_sold_date_sk         = d_date_sk
 and     d_year                  = 1999
 and     d_moy                   = 7
 and     ws_bill_addr_sk         = ca_address_sk
 and     ca_gmt_offset           = -5
 group by i_manufact_id)
  select  i_manufact_id ,sum(total_sales) total_sales
 from  (select * from ss 
        union all
        select * from cs 
        union all
        select * from ws) tmp1
 group by i_manufact_id
 order by total_sales DESC
limit 100;

-- TPC-DS_query42
select  dt.d_year
  ,item.i_category_id
  ,item.i_category
  ,sum(ss_ext_sales_price)
 from   date_dim dt
  ,store_sales
  ,item
 where dt.d_date_sk = store_sales.ss_sold_date_sk
  and store_sales.ss_item_sk = item.i_item_sk
  and item.i_manager_id = 1    
  and dt.d_moy=12
  and dt.d_year=1998
 group by   dt.d_year
    ,item.i_category_id
    ,item.i_category
 order by       sum(ss_ext_sales_price) desc,dt.d_year
    ,item.i_category_id
    ,item.i_category
limit 100;

-- TPC-DS_query37
select  i_item_id
       ,i_item_desc
       ,i_current_price
 from item, inventory, date_dim, catalog_sales
 where i_current_price between 58 and 58 + 30
 and inv_item_sk = i_item_sk
 and d_date_sk=inv_date_sk
 and d_date between cast('2001-02-11' as date) and dateadd(day,60,to_date('2001-02-11'))
 and i_manufact_id in (910,893,984,865)
 and inv_quantity_on_hand between 100 and 500
 and cs_item_sk = i_item_sk
 group by i_item_id,i_item_desc,i_current_price
 order by i_item_id
 limit 100;

-- TPC-DS_query46
select  c_last_name
       ,c_first_name
       ,ca_city
       ,bought_city
       ,ss_ticket_number
       ,amt,profit 
 from
   (select ss_ticket_number
          ,ss_customer_sk
          ,ca_city bought_city
          ,sum(ss_coupon_amt) amt
          ,sum(ss_net_profit) profit
    from store_sales,date_dim,store,household_demographics,customer_address 
    where store_sales.ss_sold_date_sk = date_dim.d_date_sk
    and store_sales.ss_store_sk = store.s_store_sk  
    and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
    and store_sales.ss_addr_sk = customer_address.ca_address_sk
    and (household_demographics.hd_dep_count = 4 or
         household_demographics.hd_vehicle_count= 3)
    and date_dim.d_dow in (6,0)
    and date_dim.d_year in (1999,1999+1,1999+2) 
    and store.s_city in ('Woodland','Rockville','Oakdale','Pleasant Grove','Springfield') 
    group by ss_ticket_number,ss_customer_sk,ss_addr_sk,ca_city) dn,customer,customer_address current_addr
    where ss_customer_sk = c_customer_sk
      and customer.c_current_addr_sk = current_addr.ca_address_sk
      and current_addr.ca_city <> bought_city
  order by c_last_name
          ,c_first_name
          ,ca_city
          ,bought_city
          ,ss_ticket_number
  limit 100;

-- TPC-DS_query48
select sum (ss_quantity)
 from store_sales, store, customer_demographics, customer_address, date_dim
 where s_store_sk = ss_store_sk
 and  ss_sold_date_sk = d_date_sk and d_year = 1999
 and  
 (
  (
   cd_demo_sk = ss_cdemo_sk
   and 
   cd_marital_status = 'S'
   and 
   cd_education_status = 'Primary'
   and 
   ss_sales_price between 100.00 and 150.00  
   )
 or
  (
  cd_demo_sk = ss_cdemo_sk
   and 
   cd_marital_status = 'U'
   and 
   cd_education_status = 'Advanced Degree'
   and 
   ss_sales_price between 50.00 and 100.00   
  )
 or 
 (
  cd_demo_sk = ss_cdemo_sk
  and 
   cd_marital_status = 'W'
   and 
   cd_education_status = '4 yr Degree'
   and 
   ss_sales_price between 150.00 and 200.00  
 )
 )
 and
 (
  (
  ss_addr_sk = ca_address_sk
  and
  ca_country = 'United States'
  and
  ca_state in ('IL', 'AR', 'UT')
  and ss_net_profit between 0 and 2000  
  )
 or
  (ss_addr_sk = ca_address_sk
  and
  ca_country = 'United States'
  and
  ca_state in ('WV', 'GA', 'NC')
  and ss_net_profit between 150 and 3000 
  )
 or
  (ss_addr_sk = ca_address_sk
  and
  ca_country = 'United States'
  and
  ca_state in ('PA', 'LA', 'MO')
  and ss_net_profit between 50 and 25000 
  )
 )
;
  
-- TPC-DS_query50
select  
   s_store_name
  ,s_company_id
  ,s_street_number
  ,s_street_name
  ,s_street_type
  ,s_suite_number
  ,s_city
  ,s_county
  ,s_state
  ,s_zip
  ,sum(case when (sr_returned_date_sk - ss_sold_date_sk <= 30 ) then 1 else 0 end)  as "30 days" 
  ,sum(case when (sr_returned_date_sk - ss_sold_date_sk > 30) and 
                 (sr_returned_date_sk - ss_sold_date_sk <= 60) then 1 else 0 end )  as "31-60 days" 
  ,sum(case when (sr_returned_date_sk - ss_sold_date_sk > 60) and 
                 (sr_returned_date_sk - ss_sold_date_sk <= 90) then 1 else 0 end)  as "61-90 days" 
  ,sum(case when (sr_returned_date_sk - ss_sold_date_sk > 90) and
                 (sr_returned_date_sk - ss_sold_date_sk <= 120) then 1 else 0 end)  as "91-120 days" 
  ,sum(case when (sr_returned_date_sk - ss_sold_date_sk  > 120) then 1 else 0 end)  as ">120 days" 
from
   store_sales
  ,store_returns
  ,store
  ,date_dim d1
  ,date_dim d2
where
    d2.d_year = 1998
and d2.d_moy  = 9
and ss_ticket_number = sr_ticket_number
and ss_item_sk = sr_item_sk
and ss_sold_date_sk   = d1.d_date_sk
and sr_returned_date_sk   = d2.d_date_sk
and ss_customer_sk = sr_customer_sk
and ss_store_sk = s_store_sk
group by
   s_store_name
  ,s_company_id
  ,s_street_number
  ,s_street_name
  ,s_street_type
  ,s_suite_number
  ,s_city
  ,s_county
  ,s_state
  ,s_zip
order by s_store_name
        ,s_company_id
        ,s_street_number
        ,s_street_name
        ,s_street_type
        ,s_suite_number
        ,s_city
        ,s_county
        ,s_state
        ,s_zip
limit 100;

-- TPC-DS_query52
select  dt.d_year
  ,item.i_brand_id brand_id
  ,item.i_brand brand
  ,sum(ss_ext_sales_price) ext_price
 from date_dim dt
     ,store_sales
     ,item
 where dt.d_date_sk = store_sales.ss_sold_date_sk
    and store_sales.ss_item_sk = item.i_item_sk
    and item.i_manager_id = 1
    and dt.d_moy=12
    and dt.d_year=2002
 group by dt.d_year
  ,item.i_brand
  ,item.i_brand_id
 order by dt.d_year
  ,ext_price desc
  ,brand_id
limit 100 ;

-- TPC-DS_query53
select  * from 
(select i_manufact_id,
sum(ss_sales_price) sum_sales,
avg(sum(ss_sales_price)) over (partition by i_manufact_id) avg_quarterly_sales
from item, store_sales, date_dim, store
where ss_item_sk = i_item_sk and
ss_sold_date_sk = d_date_sk and
ss_store_sk = s_store_sk and
d_month_seq in (1180,1180+1,1180+2,1180+3,1180+4,1180+5,1180+6,1180+7,1180+8,1180+9,1180+10,1180+11) and
((i_category in ('Books','Children','Electronics') and
i_class in ('personal','portable','reference','self-help') and
i_brand in ('scholaramalgamalg #14','scholaramalgamalg #7',
    'exportiunivamalg #9','scholaramalgamalg #9'))
or(i_category in ('Women','Music','Men') and
i_class in ('accessories','classical','fragrances','pants') and
i_brand in ('amalgimporto #1','edu packscholar #1','exportiimporto #1',
    'importoamalg #1')))
group by i_manufact_id, d_qoy ) tmp1
where case when avg_quarterly_sales > 0 
  then abs (sum_sales - avg_quarterly_sales)/ avg_quarterly_sales 
  else null end > 0.1
order by avg_quarterly_sales,
   sum_sales,
   i_manufact_id
limit 100;

-- TPC-DS_query55
select  i_brand_id brand_id, i_brand brand,
  sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
  and ss_item_sk = i_item_sk
  and i_manager_id=90
  and d_moy=12
  and d_year=1998
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
limit 100 ;

-- TPC-DS_query61
select  promotions,total,cast(promotions as decimal(17,4))/cast(total as decimal(17,4))*100
from
  (select sum(ss_ext_sales_price) promotions
   from  store_sales
        ,store
        ,promotion
        ,date_dim
        ,customer
        ,customer_address 
        ,item
   where ss_sold_date_sk = d_date_sk
   and   ss_store_sk = s_store_sk
   and   ss_promo_sk = p_promo_sk
   and   ss_customer_sk= c_customer_sk
   and   ca_address_sk = c_current_addr_sk
   and   ss_item_sk = i_item_sk 
   and   ca_gmt_offset = -6
   and   i_category = 'Home'
   and   (p_channel_dmail = 'Y' or p_channel_email = 'Y' or p_channel_tv = 'Y')
   and   s_gmt_offset = -6
   and   d_year = 1998
   and   d_moy  = 12) promotional_sales,
  (select sum(ss_ext_sales_price) total
   from  store_sales
        ,store
        ,date_dim
        ,customer
        ,customer_address
        ,item
   where ss_sold_date_sk = d_date_sk
   and   ss_store_sk = s_store_sk
   and   ss_customer_sk= c_customer_sk
   and   ca_address_sk = c_current_addr_sk
   and   ss_item_sk = i_item_sk
   and   ca_gmt_offset = -6
   and   i_category = 'Home'
   and   s_gmt_offset = -6
   and   d_year = 1998
   and   d_moy  = 12) all_sales
order by promotions, total
limit 100;

-- TPC-DS_query56
with ss as (
 select i_item_id,sum(ss_ext_sales_price) total_sales
 from
  store_sales,
  date_dim,
         customer_address,
         item
 where i_item_id in (select
     i_item_id
from item
where i_color in ('royal','ivory','floral'))
 and     ss_item_sk              = i_item_sk
 and     ss_sold_date_sk         = d_date_sk
 and     d_year                  = 2002
 and     d_moy                   = 5
 and     ss_addr_sk              = ca_address_sk
 and     ca_gmt_offset           = -5 
 group by i_item_id),
 cs as (
 select i_item_id,sum(cs_ext_sales_price) total_sales
 from
  catalog_sales,
  date_dim,
         customer_address,
         item
 where
         i_item_id               in (select
  i_item_id
from item
where i_color in ('royal','ivory','floral'))
 and     cs_item_sk              = i_item_sk
 and     cs_sold_date_sk         = d_date_sk
 and     d_year                  = 2002
 and     d_moy                   = 5
 and     cs_bill_addr_sk         = ca_address_sk
 and     ca_gmt_offset           = -5 
 group by i_item_id),
 ws as (
 select i_item_id,sum(ws_ext_sales_price) total_sales
 from
  web_sales,
  date_dim,
         customer_address,
         item
 where
         i_item_id               in (select
  i_item_id
from item
where i_color in ('royal','ivory','floral'))
 and     ws_item_sk              = i_item_sk
 and     ws_sold_date_sk         = d_date_sk
 and     d_year                  = 2002
 and     d_moy                   = 5
 and     ws_bill_addr_sk         = ca_address_sk
 and     ca_gmt_offset           = -5
 group by i_item_id)
  select  i_item_id ,sum(total_sales) total_sales
 from  (select * from ss 
        union all
        select * from cs 
        union all
        select * from ws) tmp1
 group by i_item_id
 order by total_sales
 limit 100;

-- TPC-DS_query66
select   
         w_warehouse_name
  ,w_warehouse_sq_ft
  ,w_city
  ,w_county
  ,w_state
  ,w_country
        ,ship_carriers
        ,year
  ,sum(jan_sales) as jan_sales
  ,sum(feb_sales) as feb_sales
  ,sum(mar_sales) as mar_sales
  ,sum(apr_sales) as apr_sales
  ,sum(may_sales) as may_sales
  ,sum(jun_sales) as jun_sales
  ,sum(jul_sales) as jul_sales
  ,sum(aug_sales) as aug_sales
  ,sum(sep_sales) as sep_sales
  ,sum(oct_sales) as oct_sales
  ,sum(nov_sales) as nov_sales
  ,sum(dec_sales) as dec_sales
  ,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
  ,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
  ,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
  ,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
  ,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
  ,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
  ,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
  ,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
  ,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
  ,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
  ,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
  ,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
  ,sum(jan_net) as jan_net
  ,sum(feb_net) as feb_net
  ,sum(mar_net) as mar_net
  ,sum(apr_net) as apr_net
  ,sum(may_net) as may_net
  ,sum(jun_net) as jun_net
  ,sum(jul_net) as jul_net
  ,sum(aug_net) as aug_net
  ,sum(sep_net) as sep_net
  ,sum(oct_net) as oct_net
  ,sum(nov_net) as nov_net
  ,sum(dec_net) as dec_net
 from (
     select 
  w_warehouse_name
  ,w_warehouse_sq_ft
  ,w_city
  ,w_county
  ,w_state
  ,w_country
  ,'GREAT EASTERN' || ',' || 'UPS' as ship_carriers
       ,d_year as year
  ,sum(case when d_moy = 1 
    then ws_ext_sales_price* ws_quantity else 0 end) as jan_sales
  ,sum(case when d_moy = 2 
    then ws_ext_sales_price* ws_quantity else 0 end) as feb_sales
  ,sum(case when d_moy = 3 
    then ws_ext_sales_price* ws_quantity else 0 end) as mar_sales
  ,sum(case when d_moy = 4 
    then ws_ext_sales_price* ws_quantity else 0 end) as apr_sales
  ,sum(case when d_moy = 5 
    then ws_ext_sales_price* ws_quantity else 0 end) as may_sales
  ,sum(case when d_moy = 6 
    then ws_ext_sales_price* ws_quantity else 0 end) as jun_sales
  ,sum(case when d_moy = 7 
    then ws_ext_sales_price* ws_quantity else 0 end) as jul_sales
  ,sum(case when d_moy = 8 
    then ws_ext_sales_price* ws_quantity else 0 end) as aug_sales
  ,sum(case when d_moy = 9 
    then ws_ext_sales_price* ws_quantity else 0 end) as sep_sales
  ,sum(case when d_moy = 10 
    then ws_ext_sales_price* ws_quantity else 0 end) as oct_sales
  ,sum(case when d_moy = 11
    then ws_ext_sales_price* ws_quantity else 0 end) as nov_sales
  ,sum(case when d_moy = 12
    then ws_ext_sales_price* ws_quantity else 0 end) as dec_sales
  ,sum(case when d_moy = 1 
    then ws_net_paid * ws_quantity else 0 end) as jan_net
  ,sum(case when d_moy = 2
    then ws_net_paid * ws_quantity else 0 end) as feb_net
  ,sum(case when d_moy = 3 
    then ws_net_paid * ws_quantity else 0 end) as mar_net
  ,sum(case when d_moy = 4 
    then ws_net_paid * ws_quantity else 0 end) as apr_net
  ,sum(case when d_moy = 5 
    then ws_net_paid * ws_quantity else 0 end) as may_net
  ,sum(case when d_moy = 6 
    then ws_net_paid * ws_quantity else 0 end) as jun_net
  ,sum(case when d_moy = 7 
    then ws_net_paid * ws_quantity else 0 end) as jul_net
  ,sum(case when d_moy = 8 
    then ws_net_paid * ws_quantity else 0 end) as aug_net
  ,sum(case when d_moy = 9 
    then ws_net_paid * ws_quantity else 0 end) as sep_net
  ,sum(case when d_moy = 10 
    then ws_net_paid * ws_quantity else 0 end) as oct_net
  ,sum(case when d_moy = 11
    then ws_net_paid * ws_quantity else 0 end) as nov_net
  ,sum(case when d_moy = 12
    then ws_net_paid * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
    ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
  and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
  and t_time between 46866 and 46866+28800 
  and sm_carrier in ('GREAT EASTERN','UPS')
     group by 
        w_warehouse_name
  ,w_warehouse_sq_ft
  ,w_city
  ,w_county
  ,w_state
  ,w_country
       ,d_year
 union all
     select 
  w_warehouse_name
  ,w_warehouse_sq_ft
  ,w_city
  ,w_county
  ,w_state
  ,w_country
  ,'GREAT EASTERN' || ',' || 'UPS' as ship_carriers
       ,d_year as year
  ,sum(case when d_moy = 1 
    then cs_sales_price* cs_quantity else 0 end) as jan_sales
  ,sum(case when d_moy = 2 
    then cs_sales_price* cs_quantity else 0 end) as feb_sales
  ,sum(case when d_moy = 3 
    then cs_sales_price* cs_quantity else 0 end) as mar_sales
  ,sum(case when d_moy = 4 
    then cs_sales_price* cs_quantity else 0 end) as apr_sales
  ,sum(case when d_moy = 5 
    then cs_sales_price* cs_quantity else 0 end) as may_sales
  ,sum(case when d_moy = 6 
    then cs_sales_price* cs_quantity else 0 end) as jun_sales
  ,sum(case when d_moy = 7 
    then cs_sales_price* cs_quantity else 0 end) as jul_sales
  ,sum(case when d_moy = 8 
    then cs_sales_price* cs_quantity else 0 end) as aug_sales
  ,sum(case when d_moy = 9 
    then cs_sales_price* cs_quantity else 0 end) as sep_sales
  ,sum(case when d_moy = 10 
    then cs_sales_price* cs_quantity else 0 end) as oct_sales
  ,sum(case when d_moy = 11
    then cs_sales_price* cs_quantity else 0 end) as nov_sales
  ,sum(case when d_moy = 12
    then cs_sales_price* cs_quantity else 0 end) as dec_sales
  ,sum(case when d_moy = 1 
    then cs_net_paid * cs_quantity else 0 end) as jan_net
  ,sum(case when d_moy = 2 
    then cs_net_paid * cs_quantity else 0 end) as feb_net
  ,sum(case when d_moy = 3 
    then cs_net_paid * cs_quantity else 0 end) as mar_net
  ,sum(case when d_moy = 4 
    then cs_net_paid * cs_quantity else 0 end) as apr_net
  ,sum(case when d_moy = 5 
    then cs_net_paid * cs_quantity else 0 end) as may_net
  ,sum(case when d_moy = 6 
    then cs_net_paid * cs_quantity else 0 end) as jun_net
  ,sum(case when d_moy = 7 
    then cs_net_paid * cs_quantity else 0 end) as jul_net
  ,sum(case when d_moy = 8 
    then cs_net_paid * cs_quantity else 0 end) as aug_net
  ,sum(case when d_moy = 9 
    then cs_net_paid * cs_quantity else 0 end) as sep_net
  ,sum(case when d_moy = 10 
    then cs_net_paid * cs_quantity else 0 end) as oct_net
  ,sum(case when d_moy = 11
    then cs_net_paid * cs_quantity else 0 end) as nov_net
  ,sum(case when d_moy = 12
    then cs_net_paid * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
   ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
  and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
  and t_time between 46866 AND 46866+28800 
  and sm_carrier in ('GREAT EASTERN','UPS')
     group by 
        w_warehouse_name
  ,w_warehouse_sq_ft
  ,w_city
  ,w_county
  ,w_state
  ,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
  ,w_warehouse_sq_ft
  ,w_city
  ,w_county
  ,w_state
  ,w_country
  ,ship_carriers
       ,year
 order by w_warehouse_name
 limit 100;

-- TPC-DS_query71
select i_brand_id brand_id, i_brand brand,t_hour,t_minute,
  sum(ext_price) ext_price
 from item, (select ws_ext_sales_price as ext_price, 
                        ws_sold_date_sk as sold_date_sk,
                        ws_item_sk as sold_item_sk,
                        ws_sold_time_sk as time_sk  
                 from web_sales,date_dim
                 where d_date_sk = ws_sold_date_sk
                   and d_moy=12
                   and d_year=1998
                 union all
                 select cs_ext_sales_price as ext_price,
                        cs_sold_date_sk as sold_date_sk,
                        cs_item_sk as sold_item_sk,
                        cs_sold_time_sk as time_sk
                 from catalog_sales,date_dim
                 where d_date_sk = cs_sold_date_sk
                   and d_moy=12
                   and d_year=1998
                 union all
                 select ss_ext_sales_price as ext_price,
                        ss_sold_date_sk as sold_date_sk,
                        ss_item_sk as sold_item_sk,
                        ss_sold_time_sk as time_sk
                 from store_sales,date_dim
                 where d_date_sk = ss_sold_date_sk
                   and d_moy=12
                   and d_year=1998
                 ) tmp,time_dim
 where
   sold_item_sk = i_item_sk
   and i_manager_id=1
   and time_sk = t_time_sk
   and (t_meal_time = 'breakfast' or t_meal_time = 'dinner')
 group by i_brand, i_brand_id,t_hour,t_minute
 order by ext_price desc, i_brand_id;

-- TPC-DS_query88
select  *
from
 (select count(*) h8_30_to_9
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk   
     and ss_hdemo_sk = household_demographics.hd_demo_sk 
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 8
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = -1 and household_demographics.hd_vehicle_count<=-1+2)) 
     and store.s_store_name = 'ese') s1,
 (select count(*) h9_to_9_30 
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk 
     and time_dim.t_hour = 9 
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = -1 and household_demographics.hd_vehicle_count<=-1+2))
     and store.s_store_name = 'ese') s2,
 (select count(*) h9_30_to_10 
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 9
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = -1 and household_demographics.hd_vehicle_count<=-1+2))
     and store.s_store_name = 'ese') s3,
 (select count(*) h10_to_10_30
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 10 
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = -1 and household_demographics.hd_vehicle_count<=-1+2))
     and store.s_store_name = 'ese') s4,
 (select count(*) h10_30_to_11
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 10 
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = -1 and household_demographics.hd_vehicle_count<=-1+2))
     and store.s_store_name = 'ese') s5,
 (select count(*) h11_to_11_30
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk 
     and time_dim.t_hour = 11
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = -1 and household_demographics.hd_vehicle_count<=-1+2))
     and store.s_store_name = 'ese') s6,
 (select count(*) h11_30_to_12
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 11
     and time_dim.t_minute >= 30
     and ((household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = -1 and household_demographics.hd_vehicle_count<=-1+2))
     and store.s_store_name = 'ese') s7,
 (select count(*) h12_to_12_30
 from store_sales, household_demographics , time_dim, store
 where ss_sold_time_sk = time_dim.t_time_sk
     and ss_hdemo_sk = household_demographics.hd_demo_sk
     and ss_store_sk = s_store_sk
     and time_dim.t_hour = 12
     and time_dim.t_minute < 30
     and ((household_demographics.hd_dep_count = 2 and household_demographics.hd_vehicle_count<=2+2) or
          (household_demographics.hd_dep_count = 0 and household_demographics.hd_vehicle_count<=0+2) or
          (household_demographics.hd_dep_count = -1 and household_demographics.hd_vehicle_count<=-1+2))
     and store.s_store_name = 'ese') s8;
     
-- TPC-DS_query98
select i_item_id
      ,i_item_desc 
      ,i_category 
      ,i_class 
      ,i_current_price
      ,sum(ss_ext_sales_price) as itemrevenue 
      ,sum(ss_ext_sales_price)*100/sum(sum(ss_ext_sales_price)) over
          (partition by i_class) as revenueratio
from  
  store_sales
      ,item 
      ,date_dim
where 
  ss_item_sk = i_item_sk 
    and i_category in ('Women', 'Electronics', 'Shoes')
    and ss_sold_date_sk = d_date_sk
  and d_date between cast('2002-05-27' as date) 
        and dateadd(day,30,to_date('2002-05-27'))
group by 
  i_item_id
        ,i_item_desc 
        ,i_category
        ,i_class
        ,i_current_price
order by 
  i_category
        ,i_class
        ,i_item_id
        ,i_item_desc
        ,revenueratio;