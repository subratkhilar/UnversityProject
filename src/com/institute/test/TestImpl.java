package com.institute.test;

import java.io.IOException;

public class TestImpl {
	public int check()
	{
		try {
			
			System.out.println("Try");
			return 1;
		} catch (Exception e) {
			System.out.println("catch");
			return 2;
		}finally
		{
			System.exit(0);
			System.out.println("finally");
			return 3;
		}
	}

	public static void main(String[] args) {
		
		TestImpl t = new TestImpl();
		int x = t.check();
		System.out.println(" retun value :: "+x);

	}

}
