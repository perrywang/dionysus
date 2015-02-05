package org.boilaplate.dionysus;

import java.net.URLClassLoader;
import java.util.Arrays;

public class Main {
	public static void main(String[] args) {
		URLClassLoader classLoader = (URLClassLoader) Main.class
				.getClassLoader();
		System.out.println(Arrays.toString(classLoader.getURLs()));
	}
}
