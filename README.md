# to-do-api 

This is an API developed in ruby that allows you to let you create user an each user can create task with the status ```TO DO, DOING, DONE``` 
* Configuration

  Delete the master.key and credentials.yml.enc files
  ```
  |-...
  |-config
    |-credentials.yml.enc
    |-master.key
  |-...
  ```
  run
  ```sh
  
    rails credentials:edit
  ```
    and configure the credentials
```YML

  development:
    delivery_method: YOUR_DELIVERY_METHOD
    smtp_settings: {
      user_name: YOUR_USERNAME,
      password: YOUR_PASSWORD,
      address: ADDRESS,
      domain: DOMAIN,
      port: PORT
    }
    queue_adapter: QUEUE_ADAPTER
    secret: YOUR_SECRECT
```
