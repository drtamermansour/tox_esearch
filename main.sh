conda create -n entrez
conda activate entrez
mamba install bioconda::entrez-direct
dos2unix chemicals.txt
bash create_input.sh

for f in input/*.txt;do
  bash esearch_v4.sh "$f";
done

bash split_files.sh

zip -r NonEmptyFiles.zip NonEmptyFiles/
zip -r EmptyFiles.zip EmptyFiles/

module load Rclone
rclone -v --copy-links copy NonEmptyFiles.zip remote_UCDavis_GoogleDr:temp_share/tox_esearch/.
