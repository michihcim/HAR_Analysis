run_Analysis.R
============
============

The repository contains the following files
* run_Analysis.R
* Readme.md
* CodeBook.md

The **run_Analysis.R** script works with HAR dataset obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The downloaded HAR dataset folder should be stored in the working directory for running run_Analysis.R 

run_Analysis.R combines the following information in separate files in the HAR dataset, which feature vector matching corresponding activities and subjects who performed them, and then combining the data in test and train in a single data frame
- A 561-feature vector with time and frequency domain variables contained in ‘train/X_train.txt’, ‘test_X_test.txt’, and list of features in ‘features.txt”
- Its activity label. as in 'train/y_train.txt' and 'test/y_test.txt'
- An identifier of the subject who carried out the experiment, as in ‘train/subject_train.txt’ and ‘test/subject_test.txt’

run_Analysis.R produces the following tidy data sets,
1. **filteredHAR**, a data frame which contains only the measurement of mean and standard deviation
2. **summary**, a data frame which contains the mean of the measurement in **filteredHAR** by participant and activity. It is also written into HARsummary.txt

