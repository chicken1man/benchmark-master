package atscale;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.expression.AnalyticExpression;
import net.sf.jsqlparser.expression.CaseExpression;
import net.sf.jsqlparser.expression.CastExpression;
import net.sf.jsqlparser.expression.ExtractExpression;
import net.sf.jsqlparser.expression.Function;
import net.sf.jsqlparser.expression.operators.arithmetic.Addition;
import net.sf.jsqlparser.expression.operators.arithmetic.Concat;
import net.sf.jsqlparser.expression.operators.arithmetic.Division;
import net.sf.jsqlparser.expression.operators.arithmetic.IntegerDivision;
import net.sf.jsqlparser.expression.operators.arithmetic.Multiplication;
import net.sf.jsqlparser.expression.operators.arithmetic.Subtraction;
import net.sf.jsqlparser.expression.operators.relational.ExistsExpression;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.statement.select.LateralSubSelect;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SubSelect;
import net.sf.jsqlparser.util.TablesNamesFinder;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

/**
 * Hello world!
 */
public final class BenchmarkSQLComplexityScorer {
    private BenchmarkSQLComplexityScorer() {
    }

    static Boolean bVerbose = false;

    static class BenchmarkTablesNamesFinder extends TablesNamesFinder {
        public int nFunctionRefs = 0;
        public int nOperationRefs = 0;
        public int nTableRefs = 0;
        public int nObjectRefs = 0;
        public int nSubQueriesRefs = 0;

        @Override
        public void visit(Column tableColumn) {
            if (bVerbose) {
                System.out.println("column = " + tableColumn);
            }
            nObjectRefs++;
        }

        @Override
        public void visit(Function function) {
            if (bVerbose) {
                System.out.println("function = " + function.getName());
            }
            super.visit(function);
            nFunctionRefs++;
        }

        @Override
        public void visit(CaseExpression caseExpression) {
            if (bVerbose) {
                System.out.println("function = " + caseExpression.toString());
            }
            super.visit(caseExpression);
            nFunctionRefs++;
        }

        @Override
        public void visit(Table tableName) {
            if (bVerbose) {
                System.out.println("table = " + tableName.getFullyQualifiedName());
            }
            super.visit(tableName);
            nTableRefs++;
        }

        @Override
        public void visit(SubSelect subSelect) {
            if (bVerbose) {
                System.out.println("subselect = " + subSelect.getAlias());
            }
            super.visit(subSelect);
            nSubQueriesRefs++;
        }

        @Override
        public void visit(ExistsExpression existsExpression) {
            if (bVerbose) {
                System.out.println("exists = " + existsExpression.getRightExpression());
            }
            super.visit(existsExpression);
            nSubQueriesRefs++;
        }
        
        @Override
        public void visit(Multiplication multiplication) {
            if (bVerbose) {
                System.out.println("operation = " + multiplication.toString());
            }
            super.visit(multiplication);
            nOperationRefs++;
        }

        @Override
        public void visit(Division division) {
            if (bVerbose) {
                System.out.println("operation = " + division.toString());
            }
            super.visit(division);
            nOperationRefs++;
        }

        @Override
        public void visit(IntegerDivision division) {
            if (bVerbose) {
                System.out.println("operation = " + division.toString());
            }
            super.visit(division);
            nOperationRefs++;
        }

        @Override
        public void visit(Addition addition) {
            if (bVerbose) {
                System.out.println("operation = " + addition.toString());
            }
            super.visit(addition);
            nOperationRefs++;
        }

        @Override
        public void visit(Subtraction subtraction) {
            if (bVerbose) {
                System.out.println("operation = " + subtraction.toString());
            }
            super.visit(subtraction);
            nOperationRefs++;
        }

        @Override
        public void visit(Concat concat) {
            if (bVerbose) {
                System.out.println("function = " + concat.toString());
            }
            super.visit(concat);
            nFunctionRefs++;
        }

        @Override
        public void visit(CastExpression cast) {
            if (bVerbose) {
                System.out.println("function = " + cast.toString());
            }
            super.visit(cast);
            nFunctionRefs++;
        }

        @Override
        public void visit(AnalyticExpression analytic) {
            if (bVerbose) {
                System.out.println("function = " + analytic.toString());
            }
            super.visit(analytic);
            nFunctionRefs++;
        }

        @Override
        public void visit(ExtractExpression eexpr) {
            if (bVerbose) {
                System.out.println("function = " + eexpr.toString());
            }
            super.visit(eexpr);
            nFunctionRefs++;
        }
    
        @Override
        public void visit(LateralSubSelect lateralSubSelect) {
            if (bVerbose) {
                System.out.println("function = " + lateralSubSelect.toString());
            }
            super.visit(lateralSubSelect);
            nFunctionRefs++;
        }            
    }

    /**
     * Says hello to the world.
     * 
     * @param args The arguments of the program.
     */
    public static void main(String[] args) {

        Options options = new Options();

        BenchmarkTablesNamesFinder tablesNamesFinder = new BenchmarkTablesNamesFinder();

        try {

            // Parse Command Line
            Option filePath = new Option("f", "filePath", true, "Input SQL File (SQL statements delimited by ;");
            filePath.setRequired(true);
            options.addOption(filePath);
    
            Option verboseFlag = new Option("v", "verboseFlag", true, "'true' = output detail for each query parsed'");
            verboseFlag.setRequired(false);
            options.addOption(verboseFlag);

            DefaultParser parser = new DefaultParser();
            CommandLine cmd = parser.parse(options, args);

            File inputFilePath = new File(cmd.getOptionValue("filePath"));

            if (cmd.getOptionValue("verboseFlag") != null)
                bVerbose = cmd.getOptionValue("verboseFlag").equals("true") ? true : false;

            Scanner read;
            try {
                read = new Scanner(inputFilePath);
                read.useDelimiter(";");
                String sql;
    
                while(read.hasNext())
                {
                    // ex: "SELECT count(*), max(substring(fld,1,2)), case when 1=2 then 1 else 0 end FROM tab1"
                    sql = read.next();

                    if (bVerbose) {
                        System.out.println(sql+"\n");
                    }

                    Statement stmt = CCJSqlParserUtil.parse(sql);
                    Select selectStatement = (Select) stmt;
                    tablesNamesFinder.getTableList(selectStatement);
                }
                read.close();
                } catch (FileNotFoundException e) {
                e.printStackTrace();
            }

            int totalScore = 
                tablesNamesFinder.nFunctionRefs +
                tablesNamesFinder.nOperationRefs +
                tablesNamesFinder.nTableRefs +
                tablesNamesFinder.nObjectRefs +
                tablesNamesFinder.nSubQueriesRefs;

            System.out.println("Number of functions: " + tablesNamesFinder.nFunctionRefs);
            System.out.println("Number of operations: " + tablesNamesFinder.nOperationRefs);
            System.out.println("Number of tables: " + tablesNamesFinder.nTableRefs);
            System.out.println("Number of objects: " + tablesNamesFinder.nObjectRefs);
            System.out.println("Number of subqueries: " + tablesNamesFinder.nSubQueriesRefs);
            System.out.println("TOTAL COMPLEXITY SCORE: " + totalScore);
            
        } catch (JSQLParserException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            System.out.println(e.getMessage());
            HelpFormatter formatter = new HelpFormatter();
            formatter.printHelp("BenchmarkSQLComplexityScorer", options);

            System.exit(1);
        }
    }
}
