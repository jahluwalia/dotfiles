mkdir recovered_blobs  # Create a directory to store recovered files

# Loop through each dangling blob
for blob in $(git fsck --lost-found | grep "dangling blob" | awk '{print $3}'); do
    # Create a file using the blob's hash and restore the contents
    git show $blob > recovered_blobs/$blob.txt
done
