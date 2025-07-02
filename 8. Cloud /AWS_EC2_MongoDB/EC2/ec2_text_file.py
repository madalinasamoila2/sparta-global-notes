import pymongo

client = pymongo.MongoClient("mongodb//35.157.101.65:27017")

db = client['demo']
col = db['test-collection']

col.insert_one({"success":True})

for doc in col.find():
    print(doc)
