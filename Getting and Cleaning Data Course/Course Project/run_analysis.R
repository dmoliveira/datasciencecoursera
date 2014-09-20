# Run Analysis and Get Tidy Data - Course Project at Data Science Specialization

# Tasks (Ti):
# T0. Load Data. It will depends on where it is. Please set your workspace correctly. 
# Point the Workspace to the root folder of this project.
DATA_DIR <- './Data/UCI HAR Dataset/'
TIDY_DATA <- paste(DATA_DIR, 'tidy_data.txt', sep='')
TRAIN_DIR <- paste(DATA_DIR, 'train/', sep='')
TEST_DIR <- paste(DATA_DIR, 'test/', sep='')

FEATURES_NAMES_FILE <- paste(DATA_DIR, 'features.txt', sep='')
ACTIVITY_LABELS_FILE <- paste(DATA_DIR, 'activity_labels.txt', sep='')

TRAIN_X_FILE <- paste(TRAIN_DIR, 'X_train.txt',sep='')
TRAIN_Y_FILE <- paste(TRAIN_DIR, 'y_train.txt',sep='')
SUBJECT_TRAIN <- paste(TRAIN_DIR, 'subject_train.txt',sep='')

TEST_X_FILE <- paste(TEST_DIR, 'X_test.txt',sep='')
TEST_Y_FILE <- paste(TEST_DIR, 'y_test.txt',sep='')
SUBJECT_TEST <- paste(TEST_DIR, 'subject_test.txt',sep='')

# Reading data
train_x <- read.table(TRAIN_X_FILE, sep="" , header=F, na.strings="", stringsAsFactors=F)
train_y <- read.table(TRAIN_Y_FILE, sep="" , header=F, na.strings="", stringsAsFactors=F)
subject_train <- read.table(SUBJECT_TRAIN, sep="" , header=F, na.strings="", stringsAsFactors=F)

test_x <- read.table(TEST_X_FILE, sep="" , header=F, na.strings="", stringsAsFactors=F)
test_y <- read.table(TEST_Y_FILE, sep="" , header=F, na.strings="", stringsAsFactors=F)
subject_test <- read.table(SUBJECT_TEST, sep="" , header=F, na.strings="", stringsAsFactors=F)

# T1. Merges the training and the test sets to create one data set.
train <- cbind(subject_train, train_x, train_y)
test <- cbind(subject_test, test_x, test_y)

data <- rbind(train, test)

data # Answer T1

# T2. Extracts only the measurements on the mean and standard deviation for each measurement.
features_name <- read.table(FEATURES_NAMES_FILE, header=F, na.strings="", stringsAsFactors=F)[,2]
names(data) <- c('subject_id', features_name, 'activity')

is_mean_in_feature_name <- sapply('mean', grepl, c('subject_id', features_name, 'activity'))
is_std_in_feature_name  <- sapply('std', grepl, c('subject_id', features_name, 'activity'))
is_std_in_feature_name[1,1] = TRUE # subject_id
is_std_in_feature_name[length(is_std_in_feature_name),1] = TRUE # activity

data_selected <- data[,(is_mean_in_feature_name | is_std_in_feature_name)]

data_selected # Answer T2

# T3. Uses descriptive activity names to name the activities in the data set
activity_names <- read.table(ACTIVITY_LABELS_FILE, header=F, na.strings="", stringsAsFactors=T)
data_selected$activity = as.vector(sapply(data_selected$activity, function(x) activity_names[x, 2]))

data_selected$activity # Answer T3

# T4. Appropriately labels the data set with descriptive variable names. 
label_range = 3:length(data_selected)-1
temp_label <- as.vector(sapply(names(data_selected)[label_range],function(x) substring(x, first=2)))
temp_label <- gsub('-', '_', temp_label)
temp_label <- gsub('[:(:]', '', temp_label)
temp_label <- gsub('[:):]', '', temp_label)
temp_label <- gsub('Body', 'body_', temp_label)
temp_label <- gsub('Acc', '_accelaration_', temp_label)
temp_label <- gsub('Gravity', 'gravity_', temp_label)
temp_label <- gsub('Jerk', '_jerk_', temp_label)
temp_label <- gsub('Mag', '_magnetic_', temp_label)
temp_label <- gsub('Gyro', '_gyro_', temp_label)
temp_label <- gsub('Freq', '_freq', temp_label)
temp_label <- gsub('X', 'x', temp_label)
temp_label <- gsub('Y', 'y', temp_label)
temp_label <- gsub('Z', 'z', temp_label)
temp_label <- gsub('__', '_', temp_label)
names(data_selected)[label_range]<- temp_label

names(data_selected) #Answer T4

# T5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(data.table)
data_table <- data.table(data_selected)
tidy_data <- data_table[, lapply(.SD, mean), by=list(subject_id, activity)]

tidy_data # Answer T5

write.table(x=tidy_data, file=TIDY_DATA,
            append=FALSE, sep=' ')
