# bil395-hw1
kodu çalıştırmak için : flex calculator.l
			bison -d calculator.y
			gcc -o calculator calculator.tab.c lex.yy.c -lfl
			eğer test_case.txt dosyasındaki testler çalıştırılmak iteniyor ise  ./calculator < test_case.txt
			terminalden expression girilmek istenirse ./calculator

kodun tasarımı : Matematiksel ifadelerin analizini lex dosyasında yaptım. Bu dosyada matematiksel işaretler için tokenlar atadım (daha sonra bison ile kullanabilmek için )eğer hatalı bir girişse de error dönmesini sağladım. En son return 1 ile verilerin okunmasının bittiğini döndürmüş oldum.Yacc dosyasında tanımlanmış tokenlar sayesinde grammer kurallarıyla tokena karşılık gelen matematiksel işlem yapıldı. void yyerror(const char *s) sayesinde hatalar yazdırıldı.int main() ile hesaplanan sonuç ekrana basıldı. 
