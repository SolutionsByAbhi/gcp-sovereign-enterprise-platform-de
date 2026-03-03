#!/bin/bash

echo "Finding idle disks..."
gcloud compute disks list --filter="users=[]"

echo "Finding idle IPs..."
gcloud compute addresses list --filter="status=RESERVED"
