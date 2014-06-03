
//////////////////////////////////////////////////////////////////////
//                                                                  //
//              Loading seismic data in SAC format                  //
//                                                                  //
//////////////////////////////////////////////////////////////////////

// The SAC file format is a defacto standard for seismic data used by the SAC (Seismic Analysis Code) tool developed by IRIS
// See: http://www.iris.edu/software/sac/manual/file_format.html

// You can use the Global Earthquake explorer to obtain seismic data and save it in SAC format ( http://www.seis.sc.edu/gee/ )
// The seisFile library ( licensed GPL 3.0 ) version 1.0.8 developed by the University of Southcarolina to load data from a SAC file
// See: http://www.seis.sc.edu/seisFile.html

import java.io.*;
import  edu.sc.seis.seisFile.sac.SacTimeSeries;
class PSacTimeSeries extends SacTimeSeries {
  
  // let Processing take care of the file / resource
  PSacTimeSeries(String filename) {
    try {
      InputStream fis = createInput(filename);
      if(fis == null) throw new FileNotFoundException();
      BufferedInputStream buf = new BufferedInputStream(fis);
      DataInputStream dis = new DataInputStream(buf);
      read(dis);
    } catch(IOException e) {
      e.printStackTrace();
    }
  }  
}
