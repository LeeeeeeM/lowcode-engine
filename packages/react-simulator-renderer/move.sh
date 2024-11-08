#!/bin/bash

# 远程路径
remote_path="/Users/sunliangmu/work/ss/lowcode-manage-center/public"

# 当前目录下的低代码引擎目录
CURRENT_DIR="lowcode-engine"

# 构建产物目录
DIST_DIR="dist"

# 检查当前目录下是否存在构建产物目录
if [ ! -d "${DIST_DIR}" ]; then
  echo "Error: ${DIST_DIR} directory does not exist in the current directory."
  exit 1
fi

# 检查远程路径下是否存在低代码引擎目录
if [ ! -d "${remote_path}/${CURRENT_DIR}" ]; then
  echo "Creating '${CURRENT_DIR}' directory in the remote path..."
  mkdir -p "${remote_path}/${CURRENT_DIR}"
fi


# 确保远程路径下的js目录存在
remote_js_dir="${remote_path}/${CURRENT_DIR}/${DIST_DIR}/js"
if [ ! -d "${remote_js_dir}" ]; then
  echo "Creating 'js' directory in the remote '${CURRENT_DIR}' directory..."
  mkdir -p "${remote_js_dir}"
fi

# 移动js文件夹内所有文件到远程路径对应的js目录
echo "Moving all files from '${DIST_DIR}/js' to '${remote_js_dir}'..."
mv "${DIST_DIR}/js/"* "${remote_js_dir}"

# 确保远程路径下的js目录存在
remote_css_dir="${remote_path}/${CURRENT_DIR}/${DIST_DIR}/css"
if [ ! -d "${remote_css_dir}" ]; then
  echo "Creating 'css' directory in the remote '${CURRENT_DIR}' directory..."
  mkdir -p "${remote_css_dir}"
fi

# 移动css文件夹内所有文件到远程路径对应的css目录
echo "Moving all files from '${DIST_DIR}/js' to '${remote_css_dir}'..."
mv "${DIST_DIR}/css/"* "${remote_css_dir}"

# 检查移动操作是否成功
if [ $? -eq 0 ]; then
  echo "Files moved successfully."
else
  echo "Error: Failed to move files."
  exit 1
fi
