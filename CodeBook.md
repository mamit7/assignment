# Codebook

| Variable | Type      | Description                                                                         |
| -------- | --------- | ----------------------------------------------------------------------------------- |
| subject  | integer   | Identifies the subject who performed the activity. Ranges from 1 to 30.             |
| activity | character | Identifies the activity performed by the subject. There are 6 different activities. |
| measure  | character | Identifies the feature measured.                                                    |
| mean()   | numeric   | The average of the means of the feature measured for each activity and each subject |
| std()    | numeric   | The average of the standard deviations of the feature measured for each activity and each subject|  

### Work performed to clean up the data
The original dataset has both the feature measured (e.g. tBodyAcc) and the type of measurement (mean or standard deviation) combined into a single variable in the columns. I gathered these variables, separate the feature measured and the type of measurement and then spread the type of measurements as variables again.


