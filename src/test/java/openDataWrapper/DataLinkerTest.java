package openDataWrapper;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.apache.commons.io.FileUtils;

public class DataLinkerTest {

	/**
	 * InputFiles
	 */
	String inputFileTurtle1 = "src/test/resources/input/dataset1.n3";
	String inputFileTurtle2 = "src/test/resources/input/dataset1.n3";
	String inputFileTurtle3 = "src/test/resources/input/dataset1.n3";

	/**
	 * OutputFiles
	 */
	String outputFileTurtle = "src/test/resources/output/linkedreal.n3";
	String expectedOutputFileTurtle = "src/test/resources/output/expected.n3";

	@Test
	public void testRun() {
		List<String> listFiles = new ArrayList<String>();
		listFiles.add(inputFileTurtle3);
		listFiles.add(inputFileTurtle2);
		listFiles.add(inputFileTurtle1);

		DataLinker dataLinker = DataLinker.getInstance();
		dataLinker.link(listFiles, outputFileTurtle);

		
		
		
		try {
			assertTrue(FileUtils.contentEquals(new File(outputFileTurtle),
					new File(expectedOutputFileTurtle)));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
