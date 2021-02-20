import requests

apikey=""
zipcode=""
country=""

url = "http://api.openweathermap.org/data/2.5/weather?zip={},{}&appid={}".format(zipcode, country, apikey)

responce = requests.get(url).json()

temp = int(responce["main"]["temp"]) - 273
windspeed = int(responce["wind"]["speed"])
wid = responce["weather"][0]["id"]
wgroup = wid // 100

icon = ""

if wgroup == 2:
    # ThunderStorm
    icon = "\ue30f"
elif wgroup == 3:
    # Drizzle
    icon = "\ue3aa"
elif wgroup == 5:
    # Rain
    icon = "\ue308"
elif wgroup == 6:
    # Snow
    icon = "\ue30a"
elif wgroup == 7:
    # Atmosphere
    icon = "\ue303"
elif wgroup == 8:
    if wid == 800:
        # Clear
        icon = "\ue30d"
    else:
        # Clouds
        icon = "\ue302"

result = "{}: {}C {}m/s".format(icon, temp, windspeed)

print(result)
