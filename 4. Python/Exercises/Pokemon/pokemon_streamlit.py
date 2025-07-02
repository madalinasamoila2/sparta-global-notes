# Fetching via API - easier for multiple fetches

import requests
import pandas as pd
import streamlit as st

# Step 1: Make a GET request to the API by specifying API Endpoint
url = 'https://pokeapi.co/api/v2/pokemon-species/florges'
response = requests.get(url) 

pokemon_dict_list = []

# Step 2: Convert JSON to a dictionary and then dataframe
if response.status_code == 200:
    florges_data = response.json()

    # JSON shows nested structure for the data, so we can extract variables we want
    florges_info = {
        'name': florges_data['name'],
        'base_happiness': florges_data['base_happiness'],
        'capture_rate': florges_data['capture_rate'],
        'color': florges_data['color']['name'],
        'egg_group': [egg['name'] for egg in florges_data['egg_groups']],
        'evolves_from': florges_data['evolves_from_species']['name'] if florges_data['evolves_from_species'] else None
    }

    # add to list of pokemon data
    pokemon_dict_list.append(florges_info)
    print(pokemon_dict_list)

    # Convert the dictionary into a pd.DataFrame
    df = pd.DataFrame(pokemon_dict_list)
    print(df)

# Step 3: Add more Pokemons to the dataframe - GEN 6

pokemon_names = [
    'chespin', 'quilladin', 
    'fennekin', 'braixen', 'delphox',
    'froakie', 'frogadier', 'greninja',
    'bunnelby', 'diggersby',
    'fletchinder', 'talonflame',
    'scatterbug', 'spewpa', 'vivillon',
    'litleo', 'pyroar',
    'floette', 'florges',
    'skiddo', 'gogoat',
    'pancham', 'pangoro',
    'furfrou',
    'espurr', 'meowstic',
    'honedge', 'doublade', 'aegislash',
    'spritzee', 'aromatisse',
    'swirlix', 'slurpuff',
    'inkay', 'malamar',
    'barboach', 'whiscash',
    'corphish', 'crawdaunt',
    'skrelp', 'dragalge',
    'clauncher', 'clawitzer',
    'helioptile', 'heliolisk',
    'goomy', 'sliggoo', 'goodra',
    'noibat', 'noivern',
    'xerneas', 'yveltal', 
    'diancie', 'hoopa', 'volcanion'
]

for name in pokemon_names:
    url = f'https://pokeapi.co/api/v2/pokemon-species/{name.lower()}/'
    response = requests.get(url)

    if response.status_code == 200:
        pokemon_data = response.json()

        # JSON shows nested structure for the data, so we can extract variables we want
        pokemon_info = {
            'name': pokemon_data['name'],
            'base_happiness': pokemon_data['base_happiness'],
            'capture_rate': pokemon_data['capture_rate'],
            'color': pokemon_data['color']['name'],
            'egg_group': [egg['name'] for egg in pokemon_data['egg_groups']],
            'evolves_from': pokemon_data['evolves_from_species']['name'] if pokemon_data['evolves_from_species'] else None
        }

        # Convert the dictionary into a pd.DataFrame
        pokemon_dict_list.append(pokemon_info)
    else:
        print(f"failed to retrieve columns for {name}")
        
print(pokemon_dict_list)
df_original = pd.DataFrame(pokemon_dict_list)
df_original.set_index('name', inplace= True)


# Add an image to the page
st.image("/Users/madalinasamoila/Desktop/Sparta Global/madalina-sparta-notes/3. Python/pokedex_app/Pokemon.png",  width=200)


# Set page title
st.title("Welcome to the Pokédex App🔥🦊")

# retrieve dataframe
st.write(df_original)

# choose your pokemon option
option = st.selectbox( "Choose your favourite Pokemon:",{name for name in pokemon_names})
st.write("You selected:", option)

df2 = df_original.loc[option]
st.write(pokemon_data)
