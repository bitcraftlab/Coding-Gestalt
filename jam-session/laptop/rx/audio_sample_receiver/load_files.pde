

String[] getFilenames(String folder, final String ending) {
  
  // get path
  File path = new File(dataPath(folder));
  
  // filter files by ending
  java.io.FilenameFilter filter = new java.io.FilenameFilter() {
    public boolean accept(File dir, String name) {
      return name.toLowerCase().endsWith(ending);
    }
  };
  
  File[] files = path.listFiles(filter);
  
  // get all the full paths of the files
  String filenames[] = new String[files.length];
  for(int i = 0; i < filenames.length; i++) {
    filenames[i] = files[i].getPath();
  }

  return filenames;
  
}
