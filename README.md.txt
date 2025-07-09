✅ Final README.md (English):

# Wedding Video CMS

This is a simple CMS project for managing wedding videos, built with a static frontend and a Directus backend.

## 🚀 How to Run the Project Locally

### 1. Clone the Repository

```bash
cd C:\xampp\htdocs
git clone https://github.com/Timotei10/wedding-video-cms.git

2. Start the Backend (Directus)

Navigate to the backend folder and install dependencies:

cd wedding-video-cms/cms-backend
npm install
npx directus start

    Backend will be available at: http://localhost:8055


3. Open the Frontend

You can open the frontend in two ways:
Option 1: Open directly in browser

file:///C:/xampp/htdocs/wedding-video-cms/index.html

Option 2: Use Apache (via XAMPP)

Start Apache in XAMPP, then open:

http://localhost/wedding-video-cms/index.html



⚠️ Custom 404 Page Setup

To ensure that the custom 404.html page is displayed when accessing non-existing routes:

    Make sure the .htaccess file exists in the root of the project (wedding-video-cms/.htaccess).

    The .htaccess file should contain:

ErrorDocument 404 /wedding-video-cms/404.html
Options -Indexes

In XAMPP's httpd.conf file (found in C:\xampp\apache\conf\httpd.conf), ensure that:

<Directory "C:/xampp/htdocs">
    AllowOverride All
    Require all granted
</Directory>

Then restart Apache after saving the file.

Now, navigating to a non-existent path like:

http://localhost/wedding-video-cms/non-existing-page

will properly show your custom 404 page.