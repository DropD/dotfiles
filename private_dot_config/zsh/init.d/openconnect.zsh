OPENCONNECT_PID_FILE=$HOME/.openconnect.pid

vpn-cscs () {
  test -f $OPENCONNECT_PID_FILE && echo "vpn already connected" || sudo openconnect -u ricoh@cscs.ethz.ch -g cscs --useragent AnyConnect sslvpn.ethz.ch/cscs --background --pid-file=$OPENCONNECT_PID_FILE
}

vpn-eth () {
  test -f $OPENCONNECT_PID_FILE && echo "vpn already connected" || sudo openconnect -u ricoh@staff-net.ethz.ch -g staff-net --useragent AnyConnect sslvpn.ethz.ch/staff-net --background --pid-file=$OPENCONNECT_PID_FILE
}

vpn-stop () {
  test -f $OPENCONNECT_PID_FILE && sudo kill -int $(cat $OPENCONNECT_PID_FILE) || echo "no vpn connection active"
}

vpn-status () {
  if test -f $OPENCONNECT_PID_FILE; then
    echo "connected" 
  else
    echo "not connected"
    exit 1
  fi
}
