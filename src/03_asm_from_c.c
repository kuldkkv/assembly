/* stdio.h not included because the assembly language
   module does the output */

/* prototype the fuctions which are defined in assembly */
extern void test_message (void);
extern void exit_prog(void);

int main()
{
		int x;

		for (x = 0; x < 5; x++)
				test_message();

		exit_prog();
}
