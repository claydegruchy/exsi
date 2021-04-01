echo "[Auto-Shutdown Tool] Checking if any VMs are running for auto shutdown"
esxcli system syslog mark --message="[Auto-Shutdown Tool] Checking if any VMs are running for auto shutdown"
if [[ $(esxcli vm process list | head -c1 | wc -c) == 0 ]]
then
  echo "Attempting shutdown"
  esxcli system syslog mark --message="[Auto-Shutdown Tool] No VMs running, shutting down"
  poweroff
fi
