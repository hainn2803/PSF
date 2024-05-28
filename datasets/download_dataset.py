import gdown

# URL of the Google Drive folder
folder_url = 'https://drive.google.com/drive/folders/1MMRp7mMvRj8-tORDaGTJvrAeCMYTWU2j?usp=share_link'

# Use gdown to download the folder
gdown.download_folder(folder_url, quiet=False, use_cookies=False)

print("All files in the folder downloaded successfully.")
