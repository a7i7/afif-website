# Have the private key at ~/.ssh/id_digitalocean

DEST_MACHINE=root@157.245.140.121

echo "Creating backup"
rsync -az $DEST_MACHINE:/var/www/afifahmed.com/html/* /tmp/last_backup/
rsync -az /tmp/last_backup/* $DEST_MACHINE:/root/last_backup/
echo -e "Backup complete at " $DEST_MACHINE:/root/last_backup/ "\n"

echo "Starting deployment"
rsync -az ./images ./files ./*.html ./*.css $DEST_MACHINE:/var/www/afifahmed.com/html/
echo "Deployment complete"

