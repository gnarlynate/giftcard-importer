## Shopify Gift Card Importer
1. Create a private app in your `admin/apps/private` section of your Shopify store
2. Create a `.env` file to store the `API_KEY` and `PASSWORD` variables
3. Create a `.csv` file with the following format:

![](https://screenshot.click/28-48-8c0go-ycycy.jpg)

## Things to note
- Gift Card API is only available to Shopify Plus plans. If you don't have it enabled, please reach out to your Launch Engineer/Merchant Success Manager to enable it. Include the app api key in the request
- Currently the customer field in the CSV searches using the customer email, so ensure you have the customer email in this field