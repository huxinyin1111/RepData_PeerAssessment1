complete <- function(directory, id = 1:332) {
  # 初始化一个数据框来存储结果
  results <- data.frame(id = integer(), nobs = integer())
  
  # 遍历所有监测器ID
  for (monitor_id in id) {
    # 构建文件名
    filename <- paste0(directory, "/", sprintf("%03d", monitor_id), ".csv")
    
    # 检查文件是否存在
    if (file.exists(filename)) {
      # 读取数据
      data <- read.csv(filename, header = TRUE)
      
      # 计算没有缺失值的行数
      nobs <- sum(complete.cases(data))
      
      # 将结果添加到数据框
      results <- rbind(results, data.frame(id = monitor_id, nobs = nobs))
    } else {
      warning(paste("File not found:", filename))
      # 如果文件不存在，添加NA到结果数据框
      results <- rbind(results, data.frame(id = monitor_id, nobs = NA))
    }
  }
  
  # 返回结果数据框
  return(results)
}