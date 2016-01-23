import agate
import proof

def load_data(data):
    data['table'] = agate.Table.from_csv('../csv files/failed-bank-tracker.csv')

def by_country(data):
    by_country = data['table'].group_by('Home country*')
    data['failed_by_country'] = by_country.aggregate([
        ('failed_banks', agate.Length())
    ])

def save_to_csv(data):
    data['failed_by_country'].to_csv('falied_banks_by_country.csv')

data_loaded = proof.Analysis(load_data)
data_by_country = data_loaded.then(by_country)
data_by_country.then(save_to_csv)
data_loaded.run()
