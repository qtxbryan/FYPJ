import DBConnector
import api
import argparse


parser = argparse.ArgumentParser(description="Google Play Web Scraper"
                                             "")
parser = argparse.ArgumentParser(description="Google Play Store Web Scraper ")

parser.add_argument('-d', '--details', nargs="?",help = "Show Details of the specified package")

args = vars(parser.parse_args())
app_id = args['details']

if args['details']:
    data = api.details(app_id)
    app_id = data['app_id']
    description = data['description']
    title = data['title']
    url = data['url']
    # Fields taken to create developer record
    developer_id = data['developer_id']
    dev_name = data['developer']
    print(dev_name)
    dev_email = data['developer_email']
    dev_address = data['developer_address']
    dev_url = data['developer_url']
    category = data['category']
    print(category)
    print(developer_id)

    result = DBConnector.readDeveloper(developer_id)
    if result:
        DBConnector.updateDeveloper(developer_id, dev_name, dev_url, dev_email,dev_address)
    else:
        DBConnector.createDeveloper(developer_id, dev_name, dev_url, dev_email, dev_address)

    catResult = DBConnector.readCategory(category)
    print(catResult)

    exist_app = DBConnector.readExistedApp(app_id)
    print(exist_app)

    if exist_app:
        DBConnector.updateAppDetails(app_id, description, title, url, catResult, developer_id)
    else:
        DBConnector.createAppDetails(app_id, description, title, url, catResult, developer_id)
