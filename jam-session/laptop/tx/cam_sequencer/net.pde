
InetAddress getInetAddress(String ip) {
  try {
    return InetAddress.getByName(ip);
  } catch(Exception e) {
    e.printStackTrace();
  }
  return null;
}

InetAddress[] getRemotes() {
  int n = osc_id.length;
  InetAddress[] remotes = new InetAddress[n];
  for(int i = 0; i < n; i++) {
      remotes[i] = getInetAddress(remoteprefix + osc_id[i]); 
  }
  return remotes;
}
