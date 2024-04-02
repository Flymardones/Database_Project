import java.io.IOException;
import java.util.List;

public class LoaderExample {

	public static void main(String[] args) {
		PhotosAndReportersLoader loader = new PhotosAndReportersLoader();


		try {
			System.out.println("loading from src/resources/upload.cvs");
			List<PhotoAndReporter> photosAndReporters = loader.loadPhotosAndReporters("src\\resources\\uploads.csv");
			InsertPhotosAndReporters inserter = new InsertPhotosAndReporters(photosAndReporters);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}


