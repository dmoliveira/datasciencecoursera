# Code Book
## Human Activity Recognition Using Smartphones Data Set

<table>
	<tr>
		Original web data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones got on September 16 2014 at 8:53pm.
	</tr>
	<tr>
		Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
		Smartlab - Non Linear Complex Systems Laboratory 
		DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
		activityrecognition '@' smartlab.ws 
		www.smartlab.ws 
	</tr>
</table>

### Data Overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Raw Data
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Variables and Units
Tidy data is composed of 81 variables, with the 'subject_id', 'activity' variables, and 79 variables resulting from the analysis of specific characteristics of the users collected by the devices (e.g., body accelaration, gravity acceleration, body gyro combined with mean and std in three axis). Then, the final variables are:
* subject_id                                    
* body_accelaration_mean_x                      
* body_accelaration_mean_y                      
* body_accelaration_mean_z                      
* body_accelaration_std_x                        
* body_accelaration_std_y                       
* body_accelaration_std_z                        
* gravity_accelaration_mean_x                   
* gravity_accelaration_mean_y                    
* gravity_accelaration_mean_z                   
* gravity_accelaration_std_x                     
* gravity_accelaration_std_y                    
* gravity_accelaration_std_z                     
* body_accelaration_jerk_mean_x                 
* body_accelaration_jerk_mean_y                  
* body_accelaration_jerk_mean_z                 
* body_accelaration_jerk_std_x                   
* body_accelaration_jerk_std_y                  
* body_accelaration_jerk_std_z                   
* body_gyro_mean_x                              
* body_gyro_mean_y                               
* body_gyro_mean_z                              
* body_gyro_std_x                                
* body_gyro_std_y                               
* body_gyro_std_z                                
* body_gyro_jerk_mean_x                         
* body_gyro_jerk_mean_y                          
* body_gyro_jerk_mean_z                         
* body_gyro_jerk_std_x                           
* body_gyro_jerk_std_y                          
* body_gyro_jerk_std_z                           
* body_accelaration_magnetic_mean               
* body_accelaration_magnetic_std                 
* gravity_accelaration_magnetic_mean            
* gravity_accelaration_magnetic_std              
* body_accelaration_jerk_magnetic_mean          
* body_accelaration_jerk_magnetic_std            
* body_gyro_magnetic_mean                       
* body_gyro_magnetic_std                         
* body_gyro_jerk_magnetic_mean                  
* body_gyro_jerk_magnetic_std                    
* body_accelaration_mean_x                      
* body_accelaration_mean_y                       
* body_accelaration_mean_z                      
* body_accelaration_std_x                        
* body_accelaration_std_y                       
* body_accelaration_std_z                        
* body_accelaration_mean_freq_x                 
* body_accelaration_mean_freq_y                  
* body_accelaration_mean_freq_z                 
* body_accelaration_jerk_mean_x                  
* body_accelaration_jerk_mean_y                 
* body_accelaration_jerk_mean_z                  
* body_accelaration_jerk_std_x                  
* body_accelaration_jerk_std_y                   
* body_accelaration_jerk_std_z                  
* body_accelaration_jerk_mean_freq_x             
* body_accelaration_jerk_mean_freq_y            
* body_accelaration_jerk_mean_freq_z             
* body_gyro_mean_x                              
* body_gyro_mean_y                               
* body_gyro_mean_z                              
* body_gyro_std_x                                
* body_gyro_std_y                               
* body_gyro_std_z                                
* body_gyro_mean_freq_x                         
* body_gyro_mean_freq_y                          
* body_gyro_mean_freq_z                         
* body_accelaration_magnetic_mean                
* body_accelaration_magnetic_std                
* body_accelaration_magnetic_mean_freq           
* body_body_accelaration_jerk_magnetic_mean     
* body_body_accelaration_jerk_magnetic_std       
* body_body_accelaration_jerk_magnetic_mean_freq
* body_body_gyro_magnetic_mean                   
* body_body_gyro_magnetic_std                   
* body_body_gyro_magnetic_mean_freq              
* body_body_gyro_jerk_magnetic_mean             
* body_body_gyro_jerk_magnetic_std               
* body_body_gyro_jerk_magnetic_mean_freq        
* activity    


### Transformations to get Tidy Data
* Merged train_x, train_y, test_x, test_y data-set
* Added subject_id to data
* Renamed activity values for names
* Selected only features from the 561 original features that was mean and standard deviation.
* Group all data by subject_id and activity

### Observations and Project Decisions
N/A
