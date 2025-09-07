# Backup and Restore Guide for REChain

This guide provides procedures for backing up and restoring REChain data and configurations.

## Backup Types

### Full Backup
- Complete copy of all data and configurations
- Time-consuming but comprehensive
- Suitable for disaster recovery

### Incremental Backup
- Only changes since last backup
- Faster and uses less storage
- Requires full backup as baseline

### Differential Backup
- Changes since last full backup
- Faster than full backup
- Easier to restore than incremental

## Database Backup

### PostgreSQL Backup
```bash
# Full backup
pg_dump -U rechain_user -h localhost rechain_db > rechain_backup.sql

# Compressed backup
pg_dump -U rechain_user -h localhost rechain_db | gzip > rechain_backup.sql.gz

# Restore
psql -U rechain_user -h localhost rechain_db < rechain_backup.sql
```

### MongoDB Backup
```bash
# Full backup
mongodump --db rechain --out /backup/rechain_backup

# Compressed backup
mongodump --db rechain --out - | gzip > rechain_backup.gz

# Restore
mongorestore /backup/rechain_backup
```

## File System Backup

### Application Files
```bash
# Backup application directory
tar -czf rechain_app_backup.tar.gz /opt/rechain/

# Restore
tar -xzf rechain_app_backup.tar.gz -C /opt/
```

### User Uploads
```bash
# Backup uploads directory
rsync -avz /var/rechain/uploads/ /backup/uploads/

# Restore
rsync -avz /backup/uploads/ /var/rechain/uploads/
```

## Configuration Backup

### Environment Variables
```bash
# Backup environment file
cp .env .env.backup

# Restore
cp .env.backup .env
```

### Configuration Files
```bash
# Backup config directory
tar -czf config_backup.tar.gz config/

# Restore
tar -xzf config_backup.tar.gz
```

## Automated Backup Scripts

### Daily Backup Script
```bash
#!/bin/bash

BACKUP_DIR="/backup/$(date +%Y%m%d)"
mkdir -p $BACKUP_DIR

# Database backup
pg_dump -U rechain_user rechain_db > $BACKUP_DIR/database.sql

# File backup
tar -czf $BACKUP_DIR/files.tar.gz /var/rechain/uploads/

# Config backup
tar -czf $BACKUP_DIR/config.tar.gz /opt/rechain/config/

# Clean old backups (keep last 7 days)
find /backup -type d -mtime +7 -exec rm -rf {} \;

echo "Backup completed: $BACKUP_DIR"
```

### Cron Job Setup
```bash
# Add to crontab for daily backup at 2 AM
0 2 * * * /usr/local/bin/rechain_backup.sh
```

## Cloud Backup

### AWS S3 Backup
```bash
# Install AWS CLI
pip install awscli

# Configure AWS
aws configure

# Upload backup to S3
aws s3 cp rechain_backup.tar.gz s3://rechain-backups/

# Download from S3
aws s3 cp s3://rechain-backups/rechain_backup.tar.gz .
```

### Google Cloud Storage
```bash
# Install gsutil
# Upload to GCS
gsutil cp rechain_backup.tar.gz gs://rechain-backups/

# Download from GCS
gsutil cp gs://rechain-backups/rechain_backup.tar.gz .
```

## Restore Procedures

### Complete System Restore
1. Stop all REChain services
2. Restore database from backup
3. Restore application files
4. Restore configuration files
5. Start services
6. Verify system functionality

### Partial Restore
1. Identify affected components
2. Restore only necessary data
3. Test restored components
4. Monitor for issues

## Backup Verification

### Integrity Checks
```bash
# Verify database backup
psql -U rechain_user rechain_db < rechain_backup.sql --quiet

# Verify file backup
tar -tzf rechain_backup.tar.gz | head -10

# Check file sizes
ls -lh rechain_backup.*
```

### Test Restores
- Perform regular test restores to staging environment
- Verify data integrity after restore
- Test application functionality

## Backup Security

### Encryption
```bash
# Encrypt backup
openssl enc -aes-256-cbc -salt -in rechain_backup.tar.gz -out rechain_backup.enc -k $ENCRYPTION_KEY

# Decrypt backup
openssl enc -d -aes-256-cbc -in rechain_backup.enc -out rechain_backup.tar.gz -k $ENCRYPTION_KEY
```

### Access Control
- Restrict backup file access
- Use secure transfer protocols
- Store encryption keys securely

## Monitoring Backups

### Backup Status Monitoring
```bash
# Check backup age
find /backup -name "*.tar.gz" -mtime -1 | wc -l

# Monitor backup size
du -sh /backup/
```

### Alerting
- Alert if backup fails
- Alert if backup is too old
- Alert if backup size changes significantly

## Best Practices

### 3-2-1 Rule
- 3 copies of data
- 2 different media types
- 1 offsite copy

### Regular Testing
- Test backups monthly
- Document restore procedures
- Train team on restore processes

### Retention Policy
- Daily backups: 7 days
- Weekly backups: 4 weeks
- Monthly backups: 12 months
- Yearly backups: 7 years

## Tools and Resources

- `rsync` for file synchronization
- `tar` for archiving
- `pg_dump` for PostgreSQL backups
- `mongodump` for MongoDB backups
- AWS S3, Google Cloud Storage for cloud backups

---

*This backup and restore guide is part of the REChain documentation suite.*
