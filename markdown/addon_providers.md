# Addon providers

--- row ---

**Addon provider attributes**

{:.table}
| field      | type                  |
| ---------- | --------------------- |
| id         | unique ID |
| name       | name                  |
| logo_url      | value |
| short_description | short description |
| description | description |
| category | embedded category object |
| provider_name | name of company offering this addon |
| provider_url | url of company offering this addon |
| plans | embedded array of plans for this addon |

**Addon plan attributes**

{:.table}
| field      | type                  |
| ---------- | --------------------- |
| id         | unique ID |
| name       | name (internal reference) |
| display_name | user friendly name |
| price | float, in euros |
| description | description of this plan |

**Addon category attributes**

{:.table}
| field      | type                  |
| ---------- | --------------------- |
| id         | unique ID |
| name       | name                  |

--- row ---

## List addon providers

--- row ---

`GET https://api.scalingo.com/v1/addon_providers`

||| col |||

Example

```sh
curl -H "Accept: application/json" -H "Content-Type: application/json" https://api.scalingo.com/v1/addon_providers
```

Returns 200 OK

```json
{
    "addon_providers": [{
        "name": "Scalingo PostgreSQL",
        "logo_url": "https://lb1047.pcs.ovh.net/v1/AUTH_c91a9132e4f149809d23b20b6de57161/appsdeck/postgresql.png",
        "id": "scalingo-postgresql",
        "short_description": "",
        "description": "\u003cdiv class=\"row text-center\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003ch2\u003eScalingo providing you PostgreSQL as a Service!\u003c/h2\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Magic of the Cloud\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Create PostgreSQL databases on-demand. Never think about machines and never install software. We give you a connection string, and you are good to go! The best of it: we bill by the minute.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Power of Docker\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Your PostgreSQL server is a dedicated process sealed in a Docker container in all of our plans. You can scale up and down with ease in a few seconds, from the 512MB free tier to the 32GB memory size plan and all plans within.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eOptimal PostgreSQL Performance\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Enjoy SSD-like \u003cstrong\u003eperformance\u003c/strong\u003e on our SAN-backed and dedicated PostgreSQL processes on all of our plans.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eExpert Care and Support\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Get advice from our team of experts.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eBackups\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Everybody needs backups. We take care of them, daily.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\r\n\u003cdiv class=\"row\" style=\"margin-top:20px;\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003cem\u003eBase pricing rule: 0.02€/hour/GB of RAM. Every plan includes 5 times the size of RAM as disk space. Price for over plan disk space: 2€/GB.\r\n    \u003cbr/\u003e\r\n    High availability options will be available in the coming weeks.\u003c/em\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n",
        "category": {
            "id": "54c6909b61646d0001000000",
            "name": "Data stores"
        },
        "provider_name": "",
        "provider_url": "",
        "plans": [{
            "id": "54071fa5646173000b010000",
            "name": "free",
            "display_name": "512MB Free Tier",
            "price": 0.0,
            "description": "* Free plan\r\n* No backups (you can do it yourself)\r\n* 512MB RAM\r\n* includes 512MB disk space (hard limit)\r\n* Multiple Users\r\n* Community Support\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "5474a6c66461730001010000",
            "name": "1g",
            "display_name": "1G Database",
            "price": 14.4,
            "description": "* Daily backups\r\n* 1GB RAM\r\n* Includes 5GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1 active\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca700661646d0001070000",
            "name": "2g",
            "display_name": "2G Database",
            "price": 28.8,
            "description": "* Daily backups\r\n* 2GB RAM\r\n* Includes 10GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2 active\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca708561646d0001050000",
            "name": "4g",
            "display_name": "4G Database",
            "price": 57.6,
            "description": "* Daily backups\r\n* 4GB RAM\r\n* Includes 20GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca70f761646d00010d0000",
            "name": "8g",
            "display_name": "8G Database",
            "price": 115.2,
            "description": "* Daily backups\r\n* 8GB RAM\r\n* Includes 40GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca716661646d00010f0000",
            "name": "16g",
            "display_name": "16G Database",
            "price": 230.4,
            "description": "* Daily backups\r\n* 16GB RAM\r\n* Includes 80GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e\r\n"
        }, {
            "id": "54d9e5b661646d0001020000",
            "name": "32g",
            "display_name": "32G Database",
            "price": 460.8,
            "description": "* Daily backups\r\n* 32GB RAM\r\n* Includes 160GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6 active\"\u003e\u003c/i\u003e\r\n"
        }]
    }, {
        "name": "Scalingo MySQL",
        "logo_url": "https://lb1047.pcs.ovh.net/v1/AUTH_c91a9132e4f149809d23b20b6de57161/appsdeck/mysql.png",
        "id": "scalingo-mysql",
        "short_description": "",
        "description": "\u003cdiv class=\"row text-center\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003ch2\u003eScalingo providing you MySQL as a Service!\u003c/h2\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Magic of the Cloud\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Create MySQL databases on-demand. Never think about machines and never install software. We give you a connection string, and you are good to go! The best of it: we bill by the minute.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Power of Docker\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Your MySQL server is a dedicated process sealed in a Docker container in all of our plans. You can scale up and down with ease in a few seconds, from the 512MB free tier to the 32GB memory size plan and all plans within.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eOptimal MySQL Performance\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Enjoy SSD-like \u003cstrong\u003eperformance\u003c/strong\u003e on our SAN-backed and dedicated MySQL processes on all of our plans.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eExpert Care and Support\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Get advice from our team of experts.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eBackups\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Everybody needs backups. We take care of them, daily.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\r\n\u003cdiv class=\"row\" style=\"margin-top:20px;\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003cem\u003eBase pricing rule: 0.02€/hour/GB of RAM. Every plan includes 5 times the size of RAM as disk space. Price for over plan disk space: 2€/GB.\r\n    \u003cbr/\u003e\r\n    High availability options will be available in the coming weeks.\u003c/em\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n",
        "category": {
            "id": "54c6909b61646d0001000000",
            "name": "Data stores"
        },
        "provider_name": "",
        "provider_url": "",
        "plans": [{
            "id": "53407705646173000a010000",
            "name": "free",
            "display_name": "512MB Free Tier",
            "price": 0.0,
            "description": "* Free plan\r\n* No backups (you can do it yourself)\r\n* 512MB RAM\r\n* Includes 512MB disk space (hard limit)\r\n* Multiple Users\r\n* Community Support\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "53407724646173000a060000",
            "name": "1g",
            "display_name": "1G Database",
            "price": 14.4,
            "description": "* Daily backups\r\n* 1GB RAM\r\n* Includes 5GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1 active\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca6fe161646d0001050000",
            "name": "2g",
            "display_name": "2G Database",
            "price": 28.8,
            "description": "* Daily backups\r\n* 2GB RAM\r\n* Includes 10GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2 active\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca706661646d0001090000",
            "name": "4g",
            "display_name": "4G Database",
            "price": 57.6,
            "description": "* Daily backups\r\n* 4GB RAM\r\n* Includes 20GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca70e161646d0001070000",
            "name": "8g",
            "display_name": "8G Database",
            "price": 115.2,
            "description": "* Daily backups\r\n* 8GB RAM\r\n* Includes 40GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca718d61646d00010d0000",
            "name": "16g",
            "display_name": "16G Database",
            "price": 230.4,
            "description": "* Daily backups\r\n* 16GB RAM\r\n* Includes 80GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54d9e87b61646d0001080000",
            "name": "32g",
            "display_name": "32G Database",
            "price": 460.8,
            "description": "* Daily backups\r\n* 32GB RAM\r\n* Includes 160GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6 active\"\u003e\u003c/i\u003e\r\n"
        }]
    }, {
        "name": "Scalingo MongoDB",
        "logo_url": "https://lb1047.pcs.ovh.net/v1/AUTH_c91a9132e4f149809d23b20b6de57161/appsdeck/mongodb.png",
        "id": "scalingo-mongodb",
        "short_description": "",
        "description": "\u003cdiv class=\"row text-center\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003ch2\u003eScalingo providing you MongoDB as a Service!\u003c/h2\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Magic of the Cloud\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Create MongoDB databases on-demand. Never think about machines and never install software. We give you a connection string, and you are good to go! The best of it: we bill by the minute.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Power of Docker\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Your MongoDB server is a dedicated mongod process sealed in a Docker container in all of our plans. You can scale up and down with ease in a few seconds, from the 512MB free tier to the 32GB memory size plan and all plans within.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eOptimal MongoDB Performance\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Enjoy SSD-like \u003cstrong\u003eperformance\u003c/strong\u003e on our SAN-backed and dedicated MongoDB processes on all of our plans.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eExpert Care and Support\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Get advice from our team of experts.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eOplog for single node instances\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Accessing the \u003cstrong\u003eoplog\u003c/strong\u003e is just a click away on our web dashboard! Enjoy real time features in the applications which require it. Meteor JS developers, that's for you!\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eBackups\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Everybody needs backups. We take care of them, daily.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\r\n\u003cdiv class=\"row\" style=\"margin-top:20px;\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003cem\u003eBase pricing rule: 0.02€/hour/GB of RAM. Every plan includes 5 times the size of RAM as disk space. Price for over plan disk space: 2€/GB.\r\n    \u003cbr/\u003e\r\n    High availability options will be available in the coming weeks.\u003c/em\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n",
        "category": {
            "id": "54c6909b61646d0001000000",
            "name": "Data stores"
        },
        "provider_name": "",
        "provider_url": "",
        "plans": [{
            "id": "52fd237d356330000b0a0000",
            "name": "free",
            "display_name": "512MB Free tier",
            "price": 0.0,
            "description": "* Free plan\r\n* No backups (you can do it yourself)\r\n* 512MB RAM\r\n* includes 512MB disk space (hard limit)\r\n* Multiple Users\r\n* Community Support\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "52fd2399356330000b0c0000",
            "name": "1g",
            "display_name": "1G Database",
            "price": 14.4,
            "description": "* Daily backups\r\n* 1GB RAM\r\n* Includes 5GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1 active\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca333561646d0001010000",
            "name": "2g",
            "display_name": "2G Database",
            "price": 28.8,
            "description": "* Daily backups\r\n* 2GB RAM\r\n* Includes 10GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2 active\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca391661646d0001000000",
            "name": "4g",
            "display_name": "4G Database",
            "price": 57.6,
            "description": "* Daily backups\r\n* 4GB RAM\r\n* Includes 20GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca3bfd61646d0001000000",
            "name": "8g",
            "display_name": "8G Database",
            "price": 115.2,
            "description": "* Daily backups\r\n* 8GB RAM\r\n* Includes 40GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca3c4661646d0001020000",
            "name": "16g",
            "display_name": "16G Database",
            "price": 230.4,
            "description": "* Daily backups\r\n* 16GB RAM\r\n* Includes 80GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e\r\n\r\n\r\n\r\n\r\n"
        }, {
            "id": "54d9e8a061646d00010a0000",
            "name": "32g",
            "display_name": "32G Database",
            "price": 460.8,
            "description": "* Daily backups\r\n* 32GB RAM\r\n* Includes 160GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6 active\"\u003e\u003c/i\u003e\r\n"
        }]
    }, {
        "name": "Scalingo Elasticsearch",
        "logo_url": "https://lb1047.pcs.ovh.net/v1/AUTH_c91a9132e4f149809d23b20b6de57161/appsdeck/elasticsearch.png",
        "id": "scalingo-elasticsearch",
        "short_description": "",
        "description": "\u003cdiv class=\"row text-center\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003ch2\u003eScalingo providing you Elasticsearch as a Service!\u003c/h2\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Magic of the Cloud\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Create Elasticsearch databases on-demand. Never think about machines and never install software. We give you a connection string, and you are good to go! The best of it: we bill by the minute.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Power of Docker\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Your Elasticsearch server is a dedicated process sealed in a Docker container in all of our plans. You can scale up and down with ease in a few seconds, from the 512MB free tier to the 32GB memory size plan and all plans within.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eOptimal Elasticsearch Performance\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Enjoy SSD-like \u003cstrong\u003eperformance\u003c/strong\u003e on our SAN-backed and dedicated Elasticsearch processes on all of our plans.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eExpert Care and Support\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Get advice from our team of experts.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eBackups\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Everybody needs backups. We take care of them, daily.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\r\n\u003cdiv class=\"row\" style=\"margin-top:20px;\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003cem\u003eBase pricing rule: 0.02€/hour/GB of RAM. Every plan includes 5 times the size of RAM as disk space. Price for over plan disk space: 2€/GB.\r\n    \u003cbr/\u003e\r\n    High availability options will be available in the coming weeks.\u003c/em\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n",
        "category": {
            "id": "54c6909b61646d0001000000",
            "name": "Data stores"
        },
        "provider_name": "",
        "provider_url": "",
        "plans": [{
            "id": "53b40214646173000b040000",
            "name": "free",
            "display_name": "512MB Free Tier",
            "price": 0.0,
            "description": "* Free plan\r\n* No backups (you can do it yourself)\r\n* 512MB RAM\r\n* 512MB disk space (hard limit)\r\n* Multiple Users\r\n* Community Support\r\n\r\n\u003ci class=\"fa fa-database fa-1 active\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca6fc161646d0001030000",
            "name": "1g",
            "display_name": "1G Database",
            "price": 14.4,
            "description": "* Daily backups\r\n* 1GB RAM\r\n* Includes 5GB of disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2 active\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca702761646d0001030000",
            "name": "2g",
            "display_name": "2G Database",
            "price": 28.8,
            "description": "* Daily backups\r\n* 2GB RAM\r\n* Includes 10GB of disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca709d61646d00010b0000",
            "name": "4g",
            "display_name": "4G Database",
            "price": 57.6,
            "description": "* Daily backups\r\n* 4GB RAM\r\n* Includes 20GB of disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca710b61646d0001090000",
            "name": "8g",
            "display_name": "8G Database",
            "price": 115.2,
            "description": "* Daily backups\r\n* 8GB RAM\r\n* Includes 40GB of disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca714061646d00010b0000",
            "name": "16g",
            "display_name": "16G Database",
            "price": 230.4,
            "description": "* Daily backups\r\n* 16GB RAM\r\n* Includes 80GB of disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6 active\"\u003e\u003c/i\u003e"
        }, {
            "id": "54d9e92f61646d0001020000",
            "name": "32g",
            "display_name": "32G Database",
            "price": 460.8,
            "description": "* Daily backups\r\n* 32GB RAM\r\n* Includes 160GB disk space\r\n* Multiple Users\r\n* Email Support\r\n* Price for over plan disk space: 2€/GB\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6 active\"\u003e\u003c/i\u003e\r\n"
        }]
    }, {
        "name": "Scalingo Redis",
        "logo_url": "https://lb1047.pcs.ovh.net/v1/AUTH_c91a9132e4f149809d23b20b6de57161/appsdeck/redis.png",
        "id": "scalingo-redis",
        "short_description": "",
        "description": "\u003cdiv class=\"row text-center\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003ch2\u003eScalingo providing you Redis as a Service!\u003c/h2\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Magic of the Cloud\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Create Redis databases on-demand. Never think about machines and never install software. We give you a connection string, and you are good to go! The best of it: we bill by the minute.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eThe Power of Docker\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Your Redis server is a dedicated process sealed in a Docker container in all of our plans. You can scale up and down with ease in a few seconds, from the 512MB free tier to the 4GB memory size plan and all plans within.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\"\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eExpert Care and Support\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      Get advice from our team of experts.\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n  \u003cdiv class=\"col-xs-12 col-sm-6\"\u003e\r\n    \u003ch3\u003eA free plan for your basic Redis needs\u003c/h3\u003e\r\n    \u003cp\u003e\r\n      If you just need Redis for a small number of keys (like for caching or a background jobs queue), enjoy our free tier, it's made for that!\r\n    \u003c/p\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n\r\n\u003cdiv class=\"row\" style=\"margin-top:20px;\"\u003e\r\n  \u003cdiv class=\"col-xs-12\"\u003e\r\n    \u003cem\u003eBase pricing rule: 0.02€/hour/512MB of RAM. Every plan includes the same size of RAM as disk space.\r\n    \u003cbr/\u003e\r\n    High availability options will be available in the coming weeks.\u003c/em\u003e\r\n  \u003c/div\u003e\r\n\u003c/div\u003e\r\n",
        "category": {
            "id": "54c6909b61646d0001000000",
            "name": "Data stores"
        },
        "provider_name": "",
        "provider_url": "",
        "plans": [{
            "id": "52fd2357356330000b080000",
            "name": "free",
            "display_name": "64MB Free tier",
            "price": 0.0,
            "description": "* Free plan\r\n* No backups (you can do it yourself)\r\n* 64MB RAM\r\n* 64MB disk space (hard limit)\r\n* Multiple Users\r\n* Community Support\r\n* Ideal for non critical cache or queueing system"
        }, {
            "id": "54919f476461730001060000",
            "name": "256m",
            "display_name": "256MB Database",
            "price": 7.2,
            "description": "* Daily backups\r\n* 256MB RAM\r\n* Includes 256MB disk space\r\n* Email Support\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1 active\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca878861646d0001110000",
            "name": "512m",
            "display_name": "512MB Database",
            "price": 14.4,
            "description": "* Daily backups\r\n* 512MB RAM\r\n* Includes 512MB disk space\r\n* Email Support\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2 active\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54ca87d161646d0001130000",
            "name": "1g",
            "display_name": "1G Database",
            "price": 28.8,
            "description": "* Daily backups\r\n* 1GB RAM\r\n* Includes 1GB disk space\r\n* Email Support\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54d9e43461646d0001000000",
            "name": "2g",
            "display_name": "2G Database",
            "price": 57.6,
            "description": "* Daily backups\r\n* 2GB RAM\r\n* Includes 2GB disk space\r\n* Email Support\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }, {
            "id": "54d9e45961646d0001000000",
            "name": "4g",
            "display_name": "4G Database",
            "price": 115.2,
            "description": "* Daily backups\r\n* 4GB RAM\r\n* Includes 4GB disk space\r\n* Email Support\r\n* Price displayed is computed for a total of 30 days\r\n\r\n\u003ci class=\"fa fa-database fa-1\"\u003e\u003c/i\u003e\r\n\u003ci class=\"fa fa-database fa-2\"\u003e\u003c/i\u003e\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-3\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-4\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-5 active\"\u003e\u003c/i\u003e\u0026nbsp;\u0026nbsp;\r\n\u003ci class=\"fa fa-database fa-6\"\u003e\u003c/i\u003e"
        }]
    }]
}
```
