package openDataWrapper;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import openDataWrapper.linker.DataLinker;

import org.junit.Test;
import org.apache.commons.io.FileUtils;

/**
 * Class testing Dataset linker
 * @author alexis.linard
 *
 */
public class DataLinkerTest {

	/**
	 * InputFiles
	 */
	String inputFileTurtle1 = "src/test/resources/input/dataset1.n3";
	String inputFileTurtle2 = "src/test/resources/input/dataset2.n3";

	/**
	 * OutputFiles
	 */
	String outputFileTurtle = "src/test/resources/output/linkedreal";
	String expectedOutputFileTurtle = "src/test/resources/output/expected.n3";

	//FIXME dralagen 23/11/14 : Review test because the test passe if test are executed in /home/alexis/Documents/Projets/OpenDataWrapper/openDataWrapper/openDataWrapper
	/*
	@Test
	public void testRun() {
		List<String> listFiles = new ArrayList<String>();
		listFiles.add(inputFileTurtle2);
		listFiles.add(inputFileTurtle1);

		DataLinker dataLinker = DataLinker.getInstance();
		dataLinker.link(listFiles, outputFileTurtle, null);
		
		
		try {
			assertTrue(FileUtils.contentEquals(new File(outputFileTurtle.concat(".n3")),
					new File(expectedOutputFileTurtle)));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	*/

}
