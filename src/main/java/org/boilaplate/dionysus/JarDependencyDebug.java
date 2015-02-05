package org.boilaplate.dionysus;

import java.net.URLClassLoader;
import java.util.Arrays;

public class JarDependencyDebug {
	public static void main(String[] args) {
		URLClassLoader classLoader = (URLClassLoader) JarDependencyDebug.class.getClassLoader();
		System.out.println(Arrays.toString(classLoader.getURLs()));
	}
}
