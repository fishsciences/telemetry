## POST /api/admin/create/affiliation

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createAffOID": {
        "unOID": 12345
    },
    "createAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "createAffUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "createAffOID": {
        "unOID": 2345
    },
    "createAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "createAffUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "createAffOID": {
        "unOID": 345
    },
    "createAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "createAffUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "createAffOID": {
        "unOID": 45
    },
    "createAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "createAffUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "createAffOID": {
        "unOID": 5
    },
    "createAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "createAffUID": {
        "unUID": 12345
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 12345
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 2345
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 345
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 45
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 5
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

## POST /api/admin/create/batch

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createBatchReqData": {
        "batchDataProject": {
            "unProjectID": 12345
        },
        "batchDataSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchDataSpecies": {
            "unSpecID": 12345
        },
        "batchDataTech": {
            "unTTID": 12345
        }
    },
    "createBatchReqTags": [
        {
            "tagDataName": {
                "unTagName": "8000E1349EA72A50"
            },
            "tagDataPayload": {
                "Fork Length": 110,
                "Weight": 112
            },
            "tagDataTime": "2024-02-28T15:10:04.330613746Z"
        }
    ],
    "createBatchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Response body as below.

```javascript
{
    "batchID": {
        "unBatchID": 12345
    },
    "batchProject": {
        "unProjectID": 12345
    },
    "batchSchema": {
        "fields": [
            "Fork Lenght",
            "Weight",
            "Notes"
        ],
        "units": [
            "mm",
            "g",
            null
        ]
    },
    "batchSpecies": {
        "unSpecID": 12345
    },
    "batchTech": {
        "unTTID": 12345
    }
}
```

## POST /api/admin/create/network

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createNetReqAnts": [
        {
            "antDataATID": {
                "unATID": 12345
            },
            "antDataEnd": "2024-02-29T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": 45.1
            },
            "antDataLong": {
                "unLong": 105.1
            },
            "antDataName": {
                "unAntName": "CFS012"
            },
            "antDataRegi": {
                "unRegion": 1
            },
            "antDataStart": "2024-02-28T15:10:04.330613746Z"
        },
        {
            "antDataATID": {
                "unATID": 2345
            },
            "antDataEnd": "2024-03-01T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": -38.8
            },
            "antDataLong": {
                "unLong": -21.3
            },
            "antDataName": {
                "unAntName": "NOAA523"
            },
            "antDataRegi": {
                "unRegion": 2
            },
            "antDataStart": "2024-02-29T15:10:04.330613746Z"
        }
    ],
    "createNetReqName": {
        "unNetName": "CFS Stan Network"
    },
    "createNetReqOrg": {
        "unOID": 12345
    },
    "createNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createNetReqAnts": [
        {
            "antDataATID": {
                "unATID": 12345
            },
            "antDataEnd": "2024-02-29T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": 45.1
            },
            "antDataLong": {
                "unLong": 105.1
            },
            "antDataName": {
                "unAntName": "CFS012"
            },
            "antDataRegi": {
                "unRegion": 1
            },
            "antDataStart": "2024-02-28T15:10:04.330613746Z"
        },
        {
            "antDataATID": {
                "unATID": 2345
            },
            "antDataEnd": "2024-03-01T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": -38.8
            },
            "antDataLong": {
                "unLong": -21.3
            },
            "antDataName": {
                "unAntName": "NOAA523"
            },
            "antDataRegi": {
                "unRegion": 2
            },
            "antDataStart": "2024-02-29T15:10:04.330613746Z"
        }
    ],
    "createNetReqName": {
        "unNetName": "CFS Stan Network"
    },
    "createNetReqOrg": {
        "unOID": 2345
    },
    "createNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createNetReqAnts": [
        {
            "antDataATID": {
                "unATID": 12345
            },
            "antDataEnd": "2024-02-29T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": 45.1
            },
            "antDataLong": {
                "unLong": 105.1
            },
            "antDataName": {
                "unAntName": "CFS012"
            },
            "antDataRegi": {
                "unRegion": 1
            },
            "antDataStart": "2024-02-28T15:10:04.330613746Z"
        },
        {
            "antDataATID": {
                "unATID": 2345
            },
            "antDataEnd": "2024-03-01T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": -38.8
            },
            "antDataLong": {
                "unLong": -21.3
            },
            "antDataName": {
                "unAntName": "NOAA523"
            },
            "antDataRegi": {
                "unRegion": 2
            },
            "antDataStart": "2024-02-29T15:10:04.330613746Z"
        }
    ],
    "createNetReqName": {
        "unNetName": "CFS Stan Network"
    },
    "createNetReqOrg": {
        "unOID": 345
    },
    "createNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createNetReqAnts": [
        {
            "antDataATID": {
                "unATID": 12345
            },
            "antDataEnd": "2024-02-29T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": 45.1
            },
            "antDataLong": {
                "unLong": 105.1
            },
            "antDataName": {
                "unAntName": "CFS012"
            },
            "antDataRegi": {
                "unRegion": 1
            },
            "antDataStart": "2024-02-28T15:10:04.330613746Z"
        },
        {
            "antDataATID": {
                "unATID": 2345
            },
            "antDataEnd": "2024-03-01T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": -38.8
            },
            "antDataLong": {
                "unLong": -21.3
            },
            "antDataName": {
                "unAntName": "NOAA523"
            },
            "antDataRegi": {
                "unRegion": 2
            },
            "antDataStart": "2024-02-29T15:10:04.330613746Z"
        }
    ],
    "createNetReqName": {
        "unNetName": "CFS Stan Network"
    },
    "createNetReqOrg": {
        "unOID": 45
    },
    "createNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createNetReqAnts": [
        {
            "antDataATID": {
                "unATID": 12345
            },
            "antDataEnd": "2024-02-29T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": 45.1
            },
            "antDataLong": {
                "unLong": 105.1
            },
            "antDataName": {
                "unAntName": "CFS012"
            },
            "antDataRegi": {
                "unRegion": 1
            },
            "antDataStart": "2024-02-28T15:10:04.330613746Z"
        },
        {
            "antDataATID": {
                "unATID": 2345
            },
            "antDataEnd": "2024-03-01T15:10:04.330613746Z",
            "antDataLat": {
                "unLat": -38.8
            },
            "antDataLong": {
                "unLong": -21.3
            },
            "antDataName": {
                "unAntName": "NOAA523"
            },
            "antDataRegi": {
                "unRegion": 2
            },
            "antDataStart": "2024-02-29T15:10:04.330613746Z"
        }
    ],
    "createNetReqName": {
        "unNetName": "CFS Stan Network"
    },
    "createNetReqOrg": {
        "unOID": 5
    },
    "createNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 2345
    }
}
```

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 345
    }
}
```

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 45
    }
}
```

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 5
    }
}
```

## POST /api/admin/create/org

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createOrgInfo": "North Atlantic Trout Organization",
    "createOrgName": {
        "unOrgName": "NATO"
    },
    "createOrgToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createOrgInfo": "Cramer Fish Sciences",
    "createOrgName": {
        "unOrgName": "CFS"
    },
    "createOrgToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createOrgInfo": "National Oceanic and Atmospheric Administration",
    "createOrgName": {
        "unOrgName": "NOAA"
    },
    "createOrgToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "orgID": {
        "unOID": 12345
    },
    "orgInfo": "North Atlantic Trout Organization",
    "orgName": {
        "unOrgName": "NATO"
    }
}
```

- Example (`application/json`):

```javascript
{
    "orgID": {
        "unOID": 2345
    },
    "orgInfo": "Cramer Fish Sciences",
    "orgName": {
        "unOrgName": "CFS"
    }
}
```

- Example (`application/json`):

```javascript
{
    "orgID": {
        "unOID": 345
    },
    "orgInfo": "National Oceanic and Atmospheric Administration",
    "orgName": {
        "unOrgName": "NOAA"
    }
}
```

## POST /api/admin/create/project

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createProjReqDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
    "createProjReqName": {
        "unProjName": "Project Blue Book"
    },
    "createProjReqOrg": {
        "unOID": 12345
    },
    "createProjReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Response body as below.

```javascript
{
    "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
    "projectID": {
        "unProjectID": 12345
    },
    "projectName": {
        "unProjName": "Project Blue Book"
    },
    "projectOwner": {
        "unOID": 12345
    }
}
```

## POST /api/admin/create/species

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createSpecReqName": {
        "unSpecName": "Oncorhynchus mykiss"
    },
    "createSpecReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createSpecReqName": {
        "unSpecName": "Oncorhynchus clarkii"
    },
    "createSpecReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 12345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus mykiss"
    }
}
```

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 12345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus clarkii"
    }
}
```

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 2345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus mykiss"
    }
}
```

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 2345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus clarkii"
    }
}
```

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus mykiss"
    }
}
```

## POST /api/admin/create/tech/antenna

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createAntTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "createAntTechName": {
        "unATName": "ACME PIThagoras 1000"
    },
    "createAntTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 12345
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 2345
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 345
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 45
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 5
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

## POST /api/admin/create/tech/compat

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createTechCompATID": {
        "unATID": 12345
    },
    "createTechCompTTID": {
        "unTTID": 12345
    },
    "createTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createTechCompATID": {
        "unATID": 2345
    },
    "createTechCompTTID": {
        "unTTID": 12345
    },
    "createTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createTechCompATID": {
        "unATID": 345
    },
    "createTechCompTTID": {
        "unTTID": 12345
    },
    "createTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createTechCompATID": {
        "unATID": 45
    },
    "createTechCompTTID": {
        "unTTID": 12345
    },
    "createTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createTechCompATID": {
        "unATID": 5
    },
    "createTechCompTTID": {
        "unTTID": 12345
    },
    "createTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 12345
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 2345
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 345
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 45
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 5
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

## POST /api/admin/create/tech/tag

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createTagTechMan": {
        "unTTMan": {
            "dataFields": [
                "temp"
            ],
            "dataUnits": [
                "Celsius"
            ],
            "info": "Manufactured by ACME PIT Tags, Inc."
        }
    },
    "createTagTechName": {
        "unTTName": "ISO11784"
    },
    "createTagTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createTagTechMan": {
        "unTTMan": {
            "dataFields": [
                "temp"
            ],
            "dataUnits": [
                "Celsius"
            ],
            "info": "Manufactured by ACME PIT Tags, Inc."
        }
    },
    "createTagTechName": {
        "unTTName": "TIRIS"
    },
    "createTagTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Response body as below.

```javascript
{
    "tagTechID": {
        "unTTID": 12345
    },
    "tagTechMan": {
        "unTTMan": {
            "dataFields": [
                "temp"
            ],
            "dataUnits": [
                "Celsius"
            ],
            "info": "Manufactured by ACME PIT Tags, Inc."
        }
    },
    "tagTechName": {
        "unTTName": "ISO11784"
    }
}
```

## POST /api/admin/create/user

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "createUserInfo": "this user did not provide contact information",
    "createUserName": {
        "unUserName": "JohnDoe1993"
    },
    "createUserPass": "password123",
    "createUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createUserInfo": "this user did not provide contact information",
    "createUserName": {
        "unUserName": "JohnDoe1993"
    },
    "createUserPass": "JohnDoe1984",
    "createUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createUserInfo": "this user did not provide contact information",
    "createUserName": {
        "unUserName": "JohnDoe1993"
    },
    "createUserPass": "password123",
    "createUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createUserInfo": "this user did not provide contact information",
    "createUserName": {
        "unUserName": "JohnDoe1993"
    },
    "createUserPass": "JohnDoe1984",
    "createUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "createUserInfo": "this user did not provide contact information",
    "createUserName": {
        "unUserName": "JohnDoe1993"
    },
    "createUserPass": "password123",
    "createUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 12345
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 2345
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 345
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 45
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 5
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

## POST /api/admin/delete/affiliation

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteAffOID": {
        "unOID": 12345
    },
    "deleteAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "deleteAffUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteAffOID": {
        "unOID": 2345
    },
    "deleteAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "deleteAffUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteAffOID": {
        "unOID": 345
    },
    "deleteAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "deleteAffUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteAffOID": {
        "unOID": 45
    },
    "deleteAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "deleteAffUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteAffOID": {
        "unOID": 5
    },
    "deleteAffToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "deleteAffUID": {
        "unUID": 12345
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 12345
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 2345
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 345
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 45
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affOrgID": {
        "unOID": 5
    },
    "affUserID": {
        "unUID": 12345
    }
}
```

## POST /api/admin/delete/batch

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteBatchReqID": {
        "unBatchID": 12345
    },
    "deleteBatchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteBatchReqID": {
        "unBatchID": 2345
    },
    "deleteBatchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteBatchReqID": {
        "unBatchID": 345
    },
    "deleteBatchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteBatchReqID": {
        "unBatchID": 45
    },
    "deleteBatchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteBatchReqID": {
        "unBatchID": 5
    },
    "deleteBatchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Response body as below.

```javascript
{
    "batchID": {
        "unBatchID": 12345
    },
    "batchProject": {
        "unProjectID": 12345
    },
    "batchSchema": {
        "fields": [
            "Fork Lenght",
            "Weight",
            "Notes"
        ],
        "units": [
            "mm",
            "g",
            null
        ]
    },
    "batchSpecies": {
        "unSpecID": 12345
    },
    "batchTech": {
        "unTTID": 12345
    }
}
```

## POST /api/admin/delete/network

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteNetReqID": {
        "unNetID": 12345
    },
    "deleteNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteNetReqID": {
        "unNetID": 2345
    },
    "deleteNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteNetReqID": {
        "unNetID": 345
    },
    "deleteNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteNetReqID": {
        "unNetID": 45
    },
    "deleteNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteNetReqID": {
        "unNetID": 5
    },
    "deleteNetReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 2345
    }
}
```

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 345
    }
}
```

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 45
    }
}
```

- Example (`application/json`):

```javascript
{
    "networkID": {
        "unNetID": 12345
    },
    "networkName": {
        "unNetName": "CFS Stan Network"
    },
    "networkOwner": {
        "unOID": 5
    }
}
```

## POST /api/admin/delete/org

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteOrgID": {
        "unOID": 12345
    },
    "deleteOrgToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteOrgID": {
        "unOID": 2345
    },
    "deleteOrgToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteOrgID": {
        "unOID": 345
    },
    "deleteOrgToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteOrgID": {
        "unOID": 45
    },
    "deleteOrgToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteOrgID": {
        "unOID": 5
    },
    "deleteOrgToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "orgID": {
        "unOID": 12345
    },
    "orgInfo": "North Atlantic Trout Organization",
    "orgName": {
        "unOrgName": "NATO"
    }
}
```

- Example (`application/json`):

```javascript
{
    "orgID": {
        "unOID": 2345
    },
    "orgInfo": "Cramer Fish Sciences",
    "orgName": {
        "unOrgName": "CFS"
    }
}
```

- Example (`application/json`):

```javascript
{
    "orgID": {
        "unOID": 345
    },
    "orgInfo": "National Oceanic and Atmospheric Administration",
    "orgName": {
        "unOrgName": "NOAA"
    }
}
```

## POST /api/admin/delete/project

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteProjReqID": {
        "unProjectID": 12345
    },
    "deleteProjReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteProjReqID": {
        "unProjectID": 2345
    },
    "deleteProjReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteProjReqID": {
        "unProjectID": 345
    },
    "deleteProjReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteProjReqID": {
        "unProjectID": 45
    },
    "deleteProjReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteProjReqID": {
        "unProjectID": 5
    },
    "deleteProjReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Response body as below.

```javascript
{
    "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
    "projectID": {
        "unProjectID": 12345
    },
    "projectName": {
        "unProjName": "Project Blue Book"
    },
    "projectOwner": {
        "unOID": 12345
    }
}
```

## POST /api/admin/delete/species

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteSpecReqID": {
        "unSpecID": 12345
    },
    "deleteSpecReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteSpecReqID": {
        "unSpecID": 2345
    },
    "deleteSpecReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteSpecReqID": {
        "unSpecID": 345
    },
    "deleteSpecReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteSpecReqID": {
        "unSpecID": 45
    },
    "deleteSpecReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteSpecReqID": {
        "unSpecID": 5
    },
    "deleteSpecReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 12345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus mykiss"
    }
}
```

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 12345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus clarkii"
    }
}
```

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 2345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus mykiss"
    }
}
```

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 2345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus clarkii"
    }
}
```

- Example (`application/json`):

```javascript
{
    "speciesID": {
        "unSpecID": 345
    },
    "speciesName": {
        "unSpecName": "Oncorhynchus mykiss"
    }
}
```

## POST /api/admin/delete/tech/antenna

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteAntTechID": {
        "unATID": 12345
    },
    "deleteAntTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteAntTechID": {
        "unATID": 2345
    },
    "deleteAntTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteAntTechID": {
        "unATID": 345
    },
    "deleteAntTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteAntTechID": {
        "unATID": 45
    },
    "deleteAntTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteAntTechID": {
        "unATID": 5
    },
    "deleteAntTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 12345
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 2345
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 345
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 45
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antennaTechID": {
        "unATID": 5
    },
    "antennaTechMan": {
        "unATMan": {
            "freqUnit": "kHz",
            "frequency": 135,
            "range": 18,
            "rangeUnit": "cm"
        }
    },
    "antennaTechName": {
        "unATName": "ACME PIThagoras 1000"
    }
}
```

## POST /api/admin/delete/tech/compat

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteTechCompATID": {
        "unATID": 12345
    },
    "deleteTechCompTTID": {
        "unTTID": 12345
    },
    "deleteTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteTechCompATID": {
        "unATID": 2345
    },
    "deleteTechCompTTID": {
        "unTTID": 12345
    },
    "deleteTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteTechCompATID": {
        "unATID": 345
    },
    "deleteTechCompTTID": {
        "unTTID": 12345
    },
    "deleteTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteTechCompATID": {
        "unATID": 45
    },
    "deleteTechCompTTID": {
        "unTTID": 12345
    },
    "deleteTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteTechCompATID": {
        "unATID": 5
    },
    "deleteTechCompTTID": {
        "unTTID": 12345
    },
    "deleteTechCompToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 12345
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 2345
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 345
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 45
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "tcompAntennaTech": {
        "unATID": 5
    },
    "tcompTagTech": {
        "unTTID": 12345
    }
}
```

## POST /api/admin/delete/tech/tag

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteTagTechID": {
        "unTTID": 12345
    },
    "deleteTagTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteTagTechID": {
        "unTTID": 2345
    },
    "deleteTagTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteTagTechID": {
        "unTTID": 345
    },
    "deleteTagTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteTagTechID": {
        "unTTID": 45
    },
    "deleteTagTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteTagTechID": {
        "unTTID": 5
    },
    "deleteTagTechToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Response body as below.

```javascript
{
    "tagTechID": {
        "unTTID": 12345
    },
    "tagTechMan": {
        "unTTMan": {
            "dataFields": [
                "temp"
            ],
            "dataUnits": [
                "Celsius"
            ],
            "info": "Manufactured by ACME PIT Tags, Inc."
        }
    },
    "tagTechName": {
        "unTTName": "ISO11784"
    }
}
```

## POST /api/admin/delete/user

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "deleteUserID": {
        "unUID": 12345
    },
    "deleteUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteUserID": {
        "unUID": 2345
    },
    "deleteUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteUserID": {
        "unUID": 345
    },
    "deleteUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteUserID": {
        "unUID": 45
    },
    "deleteUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "deleteUserID": {
        "unUID": 5
    },
    "deleteUserToken": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 12345
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 2345
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 345
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 45
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userDataID": {
        "unUID": 5
    },
    "userDataInfo": "this user did not provide contact information",
    "userDataName": {
        "unUserName": "JohnDoe1993"
    }
}
```

## POST /api/auth/login

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "loginName": {
        "unUserName": "JohnDoe1993"
    },
    "loginPwd": "password123"
}
```

- Example (`application/json`):

```javascript
{
    "loginName": {
        "unUserName": "JohnDoe1993"
    },
    "loginPwd": "JohnDoe1984"
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Response body as below.

```javascript
{
    "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
}
```

## POST /api/auth/logout

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "unLogout": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 204
- Headers: []

- No response body

## POST /api/data/download

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "downReqSpec": {
        "downloadRegion": {
            "unRegion": 1
        },
        "downloadSpeciesID": {
            "unSpecID": 12345
        }
    },
    "downReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "downReqSpec": {
        "downloadRegion": {
            "unRegion": 2
        },
        "downloadSpeciesID": {
            "unSpecID": 12345
        }
    },
    "downReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "downReqSpec": {
        "downloadRegion": {
            "unRegion": 3
        },
        "downloadSpeciesID": {
            "unSpecID": 12345
        }
    },
    "downReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "downReqSpec": {
        "downloadRegion": {
            "unRegion": 4
        },
        "downloadSpeciesID": {
            "unSpecID": 12345
        }
    },
    "downReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "downReqSpec": {
        "downloadRegion": {
            "unRegion": 5
        },
        "downloadSpeciesID": {
            "unSpecID": 12345
        }
    },
    "downReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/octet-stream`

- No response body

## POST /api/data/upload

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "upReqData": [
        {
            "regDataAnt": {
                "unAntName": "CFS012"
            },
            "regDataData": {
                "temp": 39.0
            },
            "regDataTag": {
                "unTagName": "8000E1349EA72A50"
            },
            "regDataTime": "2024-02-28T15:10:04.330613746Z"
        }
    ],
    "upReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 204
- Headers: []

- No response body

## POST /api/list/affiliations

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "affReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "affReqUID": {
        "unUID": 12345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "affReqUID": {
        "unUID": 2345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "affReqUID": {
        "unUID": 345
    }
}
```

- Example (`application/json`):

```javascript
{
    "affReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "affReqUID": {
        "unUID": 45
    }
}
```

- Example (`application/json`):

```javascript
{
    "affReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    },
    "affReqUID": {
        "unUID": 5
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    },
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "orgID": {
            "unOID": 2345
        },
        "orgInfo": "Cramer Fish Sciences",
        "orgName": {
            "unOrgName": "CFS"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    },
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    },
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    }
]
```

## POST /api/list/batches

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "batchReqProj": {
        "unProjectID": 12345
    },
    "batchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "batchReqProj": {
        "unProjectID": 2345
    },
    "batchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "batchReqProj": {
        "unProjectID": 345
    },
    "batchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "batchReqProj": {
        "unProjectID": 45
    },
    "batchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "batchReqProj": {
        "unProjectID": 5
    },
    "batchReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    },
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    },
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    },
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    },
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    },
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    },
    {
        "batchID": {
            "unBatchID": 12345
        },
        "batchProject": {
            "unProjectID": 12345
        },
        "batchSchema": {
            "fields": [
                "Fork Lenght",
                "Weight",
                "Notes"
            ],
            "units": [
                "mm",
                "g",
                null
            ]
        },
        "batchSpecies": {
            "unSpecID": 12345
        },
        "batchTech": {
            "unTTID": 12345
        }
    }
]
```

## POST /api/list/networks

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "netReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "networkID": {
            "unNetID": 12345
        },
        "networkName": {
            "unNetName": "CFS Stan Network"
        },
        "networkOwner": {
            "unOID": 12345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "networkID": {
            "unNetID": 12345
        },
        "networkName": {
            "unNetName": "CFS Stan Network"
        },
        "networkOwner": {
            "unOID": 12345
        }
    },
    {
        "networkID": {
            "unNetID": 12345
        },
        "networkName": {
            "unNetName": "CFS Stan Network"
        },
        "networkOwner": {
            "unOID": 12345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "networkID": {
            "unNetID": 12345
        },
        "networkName": {
            "unNetName": "CFS Stan Network"
        },
        "networkOwner": {
            "unOID": 2345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "networkID": {
            "unNetID": 12345
        },
        "networkName": {
            "unNetName": "CFS Stan Network"
        },
        "networkOwner": {
            "unOID": 12345
        }
    },
    {
        "networkID": {
            "unNetID": 12345
        },
        "networkName": {
            "unNetName": "CFS Stan Network"
        },
        "networkOwner": {
            "unOID": 12345
        }
    },
    {
        "networkID": {
            "unNetID": 12345
        },
        "networkName": {
            "unNetName": "CFS Stan Network"
        },
        "networkOwner": {
            "unOID": 12345
        }
    }
]
```

## POST /api/list/orgs

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "orgReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    },
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "orgID": {
            "unOID": 2345
        },
        "orgInfo": "Cramer Fish Sciences",
        "orgName": {
            "unOrgName": "CFS"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    },
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    },
    {
        "orgID": {
            "unOID": 12345
        },
        "orgInfo": "North Atlantic Trout Organization",
        "orgName": {
            "unOrgName": "NATO"
        }
    }
]
```

## POST /api/list/projects

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "projReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    },
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    },
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    },
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    },
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    },
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    },
    {
        "projectDesc": "Contact: J. Allen Hynek, jhyneck@af.mil ",
        "projectID": {
            "unProjectID": 12345
        },
        "projectName": {
            "unProjName": "Project Blue Book"
        },
        "projectOwner": {
            "unOID": 12345
        }
    }
]
```

## POST /api/list/species

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "specReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "speciesID": {
            "unSpecID": 12345
        },
        "speciesName": {
            "unSpecName": "Oncorhynchus mykiss"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "speciesID": {
            "unSpecID": 12345
        },
        "speciesName": {
            "unSpecName": "Oncorhynchus mykiss"
        }
    },
    {
        "speciesID": {
            "unSpecID": 12345
        },
        "speciesName": {
            "unSpecName": "Oncorhynchus mykiss"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "speciesID": {
            "unSpecID": 12345
        },
        "speciesName": {
            "unSpecName": "Oncorhynchus clarkii"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "speciesID": {
            "unSpecID": 12345
        },
        "speciesName": {
            "unSpecName": "Oncorhynchus mykiss"
        }
    },
    {
        "speciesID": {
            "unSpecID": 12345
        },
        "speciesName": {
            "unSpecName": "Oncorhynchus mykiss"
        }
    },
    {
        "speciesID": {
            "unSpecID": 12345
        },
        "speciesName": {
            "unSpecName": "Oncorhynchus mykiss"
        }
    }
]
```

## POST /api/list/tech/antenna

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "antTechReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    },
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "antennaTechID": {
            "unATID": 2345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    },
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    },
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    }
]
```

## POST /api/list/tech/compat/antenna

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "antCompReqTTID": {
        "unATID": 12345
    },
    "antCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antCompReqTTID": {
        "unATID": 2345
    },
    "antCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antCompReqTTID": {
        "unATID": 345
    },
    "antCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antCompReqTTID": {
        "unATID": 45
    },
    "antCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "antCompReqTTID": {
        "unATID": 5
    },
    "antCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    }
]
```

## POST /api/list/tech/compat/tag

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "tagCompReqTTID": {
        "unTTID": 12345
    },
    "tagCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "tagCompReqTTID": {
        "unTTID": 2345
    },
    "tagCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "tagCompReqTTID": {
        "unTTID": 345
    },
    "tagCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "tagCompReqTTID": {
        "unTTID": 45
    },
    "tagCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "tagCompReqTTID": {
        "unTTID": 5
    },
    "tagCompReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    },
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "antennaTechID": {
            "unATID": 2345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    },
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    },
    {
        "antennaTechID": {
            "unATID": 12345
        },
        "antennaTechMan": {
            "unATMan": {
                "freqUnit": "kHz",
                "frequency": 135,
                "range": 18,
                "rangeUnit": "cm"
            }
        },
        "antennaTechName": {
            "unATName": "ACME PIThagoras 1000"
        }
    }
]
```

## POST /api/list/tech/tag

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "tagTechReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    },
    {
        "tagTechID": {
            "unTTID": 12345
        },
        "tagTechMan": {
            "unTTMan": {
                "dataFields": [
                    "temp"
                ],
                "dataUnits": [
                    "Celsius"
                ],
                "info": "Manufactured by ACME PIT Tags, Inc."
            }
        },
        "tagTechName": {
            "unTTName": "ISO11784"
        }
    }
]
```

## POST /api/list/users

### Request:

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
{
    "userReqOrg": {
        "unOID": 12345
    },
    "userReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userReqOrg": {
        "unOID": 2345
    },
    "userReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userReqOrg": {
        "unOID": 345
    },
    "userReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userReqOrg": {
        "unOID": 45
    },
    "userReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

- Example (`application/json`):

```javascript
{
    "userReqOrg": {
        "unOID": 5
    },
    "userReqTok": {
        "unToken": "298f7a916218ef90a189ffefb77ef7d0834dfde6342981c86f9076c8a0cee2bd"
    }
}
```

### Response:

- Status code 200
- Headers: []

- Supported content types are:

    - `application/json`

- Example (`application/json`):

```javascript
[]
```

- Example (`application/json`):

```javascript
[
    {
        "userDataID": {
            "unUID": 12345
        },
        "userDataInfo": "this user did not provide contact information",
        "userDataName": {
            "unUserName": "JohnDoe1993"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "userDataID": {
            "unUID": 12345
        },
        "userDataInfo": "this user did not provide contact information",
        "userDataName": {
            "unUserName": "JohnDoe1993"
        }
    },
    {
        "userDataID": {
            "unUID": 12345
        },
        "userDataInfo": "this user did not provide contact information",
        "userDataName": {
            "unUserName": "JohnDoe1993"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "userDataID": {
            "unUID": 2345
        },
        "userDataInfo": "this user did not provide contact information",
        "userDataName": {
            "unUserName": "JohnDoe1993"
        }
    }
]
```

- Example (`application/json`):

```javascript
[
    {
        "userDataID": {
            "unUID": 12345
        },
        "userDataInfo": "this user did not provide contact information",
        "userDataName": {
            "unUserName": "JohnDoe1993"
        }
    },
    {
        "userDataID": {
            "unUID": 12345
        },
        "userDataInfo": "this user did not provide contact information",
        "userDataName": {
            "unUserName": "JohnDoe1993"
        }
    },
    {
        "userDataID": {
            "unUID": 12345
        },
        "userDataInfo": "this user did not provide contact information",
        "userDataName": {
            "unUserName": "JohnDoe1993"
        }
    }
]
```

