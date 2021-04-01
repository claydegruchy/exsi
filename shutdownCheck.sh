
esxcli system syslog mark --message="[Auto-Shutdown Tool] Checking if ay VMs running for auto shutdown"
if [[ $(esxcli vm process list | head -c1 | wc -c) == 1 ]]
then
  echo "Attempting shutdown"
  esxcli system syslog mark --message="[Auto-Shutdown Tool] No VMs running, shutting down"
  # esxcli system shutdown poweroff -r="[Auto-Shutdown Tool] No VMs running, shutting down"
  poweroff
fi
