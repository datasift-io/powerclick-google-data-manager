___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Google Data Manager API Conversion Events \u2014 PowerClick",
  "categories": [
    "CONVERSIONS",
    "ADVERTISING",
    "ATTRIBUTION"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "PowerClick"
  },
  "description": "Tag that sends conversion events to Google's platforms (Google Analytics, Google Ads, Campaign Manager 360, Search Ads 360, and Display & Video 360) using the Data Manager API. PowerClick build of Stape's template (stape-io/google-conversion-events-tag): also reports each platform response to PowerClick.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "eventType",
    "displayName": "Event Type",
    "radioItems": [
      {
        "value": "conversion",
        "displayValue": "Conversion"
      },
      {
        "value": "pageview",
        "displayValue": "Pageview"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "conversion",
    "help": "<b>Conversion</b>\n<br/>\nSends the conversion event.\n<br/><br/>\n<b>Pageview</b> \n<br/>\nSets the the <i>_dm_session_attributes</i> cookie containing a base64 JSON encoded string with the <i>Session Attributes</i> values for conversion event attribution and modeling. Useful for Floodlight and Google Ads conversions.\n<br/>\nDefault mappings: \n<ul> \n<li>Session Attribute <i>gad_source</i>: <i>gad_source</i> URL Parameter value </li>\n<li>Session Attribute <i>gad_campaignid</i>: <i>gad_campaignid</i> URL Parameter value</li> <li>Session Attribute <i>landing_page_url</i>: <i>page_location</i> Event Data value</li>\n<li>Session Attribute <i>landing_page_referrer</i>: <i>page_referrer</i> Event Data value</li></li>\n<li>Session Attribute <i>landing_page_user_agent</i>: <i>user_agent</i> Event Data value</li></li>\n<li>Session Attribute <i>session_start_time_usec</i>: current timestamp of the time when the Pageview tag set the cookie</li>\n</ul>\n<br/> Learn more: <a href=\"https://support.google.com/google-ads/answer/16194756?hl=en\">[1]</a> and <a href=\"https://ads-developers.googleblog.com/2025/08/maximize-performance-of-your-google-ads.html\">[2]</a>."
  },
  {
    "type": "GROUP",
    "name": "pageviewGroup",
    "subParams": [
      {
        "type": "GROUP",
        "name": "cookieSettingsGroup",
        "displayName": "Session Attributes Cookie Settings (Web only)",
        "groupStyle": "ZIPPY_OPEN",
        "subParams": [
          {
            "type": "TEXT",
            "name": "cookieExpiration",
            "displayName": "Cookie Expiration",
            "simpleValueType": true,
            "help": "The number of days Session Attributes cookie will live.\n<br><br>\nGoogle advertising platforms have a maximum lookback window of 90 days. Therefore, it's advised not to exceed 90 days of expiration.",
            "valueUnit": "days",
            "defaultValue": 90,
            "valueHint": "90",
            "valueValidators": [
              {
                "type": "NON_NEGATIVE_NUMBER"
              }
            ]
          },
          {
            "type": "TEXT",
            "name": "cookieDomain",
            "displayName": "Cookie Domain",
            "simpleValueType": true,
            "help": "Overrides the cookie domain (defaults to <b>auto</b>).\n<br/>\nEnter your website's top-level domain as a fixed value (e.g., example.com).\n<br/>\nIf left as default, the top-level domain will be automatically determined using the following priority:\n<ul>\n<li>Top-level domain of the <i>Forwarded</i> header (if present).</li>\n<li>Top-level domain of the <i>X-Forwarded-Host</i> header (if present).</li>\n<li>Top-level domain of the <i>Host</i> header.</li>\n</ul>",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "auto",
            "valueHint": "example.com"
          },
          {
            "type": "SELECT",
            "name": "cookieSameSite",
            "displayName": "Cookie SameSite",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "none",
                "displayValue": "None"
              },
              {
                "value": "lax",
                "displayValue": "Lax"
              },
              {
                "value": "strict",
                "displayValue": "Strict"
              }
            ],
            "simpleValueType": true,
            "defaultValue": "none",
            "help": "<a href=\"https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value\">Learn more</a>."
          },
          {
            "type": "SELECT",
            "name": "cookieHttpOnly",
            "displayName": "Http Only Flag",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": false,
                "displayValue": "False"
              },
              {
                "value": true,
                "displayValue": "True"
              }
            ],
            "simpleValueType": true,
            "defaultValue": true
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "pageview",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "conversionGroup",
    "subParams": [
      {
        "type": "RADIO",
        "name": "authFlow",
        "displayName": "Authentication Type",
        "radioItems": [
          {
            "value": "stape",
            "displayValue": "Stape Google Connection",
            "help": "You can enable it on the Stape container settings, in the <a href=\"https://app.stape.io/container/\" target=\"_blank\">Connections</a> section.\n</br></br>\n<a href=\"https://stape.io/solutions/data-manager-api-connection\" target=\"_blank\">Learn more here.</a>",
            "subParams": []
          },
          {
            "value": "own",
            "displayValue": "Own Google Credentials",
            "help": "This type of auth is more complicated. Only choose it if you know what you are doing and do not want to use the Stape Google Connection authentication.\n<br/><br/>\nIt uses the <a href=\"https://cloud.google.com/docs/authentication/application-default-credentials\">GCP Application Default Credentials</a> to automatically find credentials from the server environment.\n<br/><br/>\nIt's performed through a <a href=\"https://developers.google.com/data-manager/api/devguides/quickstart/set-up-access?credential_type=service_account\">Service Account impersonation</a>.\n<br/><br/>\n<a href=\"https://github.com/stape-io/google-conversion-events-tag?tab=readme-ov-file#how-to-use-the-google-conversion-events-tag\">Learn more and how-to</a>."
          }
        ],
        "simpleValueType": true,
        "defaultValue": "stape"
      },
      {
        "type": "GROUP",
        "name": "destinationsGroup",
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "stapeAuthDestinationsList",
            "displayName": "Destination Accounts and Conversion Events",
            "simpleTableColumns": [
              {
                "defaultValue": "GOOGLE_ADS",
                "displayName": "Product",
                "name": "product",
                "type": "SELECT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "selectItems": [
                  {
                    "value": "GOOGLE_ADS",
                    "displayValue": "Google Ads"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Operating Customer ID",
                "name": "operatingAccountId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Customer ID",
                "name": "linkedAccountId",
                "type": "TEXT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ],
                "valueHint": "1234567890"
              },
              {
                "defaultValue": "",
                "displayName": "Conversion Event ID",
                "name": "productDestinationId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "isUnique": true,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              }
            ],
            "enablingConditions": [
              {
                "paramName": "authFlow",
                "paramValue": "stape",
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "TABLE_ROW_COUNT",
                "args": [
                  1,
                  10
                ]
              }
            ],
            "newRowButtonText": "Add Conversion Event",
            "help": "<b>Product</b>: The Product the Conversion belongs to.\n<br/><br/>\n<b>Operating Customer ID</b>: The <i>Account ID</i> (without hyphens) of the account (Google Ads account, DV360 account etc.) that will receive the conversion events. <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/Destination\">Learn more</a>.\n<br/><br/>\n<b>Customer ID</b>: The <i>Account ID</i> (without hyphens) of the account for which the link between the Data Partner account (Stape) and the Advertiser account was established.\n<br/>\ne.g. the link between the Data Partner account (Stape) and Advertiser account can be done at MCC level, but the data is going to be sent to a subaccount of the MCC.\n<br/>\nIn this case: the <i>Customer Account</i> is the MCC, and <i>Operating Customer Account</i> is the subaccount.\n<br/>\nIf the link is done with the same account that will receive the data, then the <i>Customer Account</i> and <i>Operating Customer Account</i> are the same.\n<br/>\n<a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/Destination\">Learn more</a>.\n<br/><br/>\n<b>Conversion Event ID</b>: The ID of the conversion you want to interact with.\n<br/>\nYou can find it by going to the <i>Google Ads account > Goals > Conversions > Summary > Access the desired Conversion Action</i>. After you click on the Conversion Action, the ID is on the <b>ctId</b> URL query parameter on your browser.\n<br/>"
          },
          {
            "type": "SIMPLE_TABLE",
            "name": "ownAuthDestinationsList",
            "displayName": "Destination Accounts and Conversion Events",
            "simpleTableColumns": [
              {
                "defaultValue": "GOOGLE_ADS",
                "displayName": "Product",
                "name": "product",
                "type": "SELECT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "selectItems": [
                  {
                    "value": "GOOGLE_ADS",
                    "displayValue": "Google Ads"
                  },
                  {
                    "value": "FLOODLIGHT_CONFIG",
                    "displayValue": "CM, DV and SA 360 (Floodlight)"
                  },
                  {
                    "value": "GOOGLE_ANALYTICS_PROPERTY",
                    "displayValue": "Google Analytics"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Operating Customer ID",
                "name": "operatingAccountId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "POSITIVE_NUMBER"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Customer ID",
                "name": "loginAccountId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "valueValidators": []
              },
              {
                "defaultValue": "",
                "displayName": "Conversion Event ID",
                "name": "productDestinationId",
                "type": "TEXT",
                "valueHint": "1234567890",
                "isUnique": true,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "\\d+|[A-Z]+-[A-Z0-9]+"
                    ],
                    "errorMessage": "This value must be an integer (for Google Ads and Floodlights), a Measurement ID (for Google Analytics web streams) or a Firebase App ID (for Google Analytics app streams)."
                  }
                ]
              }
            ],
            "enablingConditions": [
              {
                "paramName": "authFlow",
                "paramValue": "own",
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "TABLE_ROW_COUNT",
                "args": [
                  1,
                  10
                ]
              }
            ],
            "newRowButtonText": "Add Conversion Event",
            "help": "<b>Product</b>: The Product the Conversion belongs to.\n<br/><br/>\n<b>Operating Customer ID</b>: The <i>Account ID</i> (without hyphens) of the account (Google Analytics property, Google Ads account, CM360 account etc.) that will receive the conversion events. \n<br/>\nFor CM360, it's the <a href=\"https://support.google.com/campaignmanager/answer/11568119?hl=en\"><i>Advertiser ID</i></a>.\n<br/>\nFor Google Analytics, it's the <a href=\"https://developers.google.com/analytics/devguides/reporting/data/v1/property-id#google_analytics\">Property ID</a>.\n<br/>\n<a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/Destination\">Learn more</a>.\n<br/><br/>\n<b>Customer ID</b>: The <i>Account ID</i> of the account (Google Analytics property, Google Ads account, CM360 account etc.) used for authorization (without hyphens) when making the API request. \n<br/>\nFor CM360, it's the <a href=\"https://support.google.com/campaignmanager/answer/11568119?hl=en\"><i>Advertiser ID</i></a>.\n<br/>\nFor Google Analytics, it's the <a href=\"https://developers.google.com/analytics/devguides/reporting/data/v1/property-id#google_analytics\">Property ID</a> (you can leave it blank).\n<br/>\nFor ads products:\n<ul>\n<li>If your credentials are for access to a <i>Manager Account</i> that has the <i>Operating Account</i> as one of its subaccounts, set the <i>Customer ID</i> to the ID of the <i>Manager Account</i>.</li>\n<li>If your credentials are for the account that is the <i>Operating Account</i>, you don't need to set <i>Customer ID</i>.</li>\n</ul>\n<br/>\nLearn more: <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/Destination\">[1]</a> and <a href=\"https://developers.google.com/data-manager/api/get-started/quickstart/send-events?persona=advertiser#prepare_a_destination\">[2]</a>.\n<br/><br/>\n<b>Conversion Event ID</b>: The ID of the conversion you want to interact with.\n<br/>\nFor <b>Google Ads</b>, you can find it by going to the <i>Google Ads account > Goals > Conversions > Summary > Access the desired Conversion Action</i>. After you click on the Conversion Action, the ID is on the <b>ctId</b> URL query parameter on your browser. <a href=\"https://developers.google.com/data-manager/api/devguides/concepts/destinations#ads-event\">Learn more</a>\n<br/>\nFor <b>CM, DV and SA 360</b>, it's the Floodlight Activity ID. You can find it by going to the <i>Activities</i> page. The ID is the number next to the name in the Activity name column. <a href=\"https://developers.google.com/data-manager/api/devguides/concepts/destinations#floodlight-event\">Learn more</a>.\n<br/>\nFor <b>Google Analytics</b>, it's the <a href=\"https://support.google.com/analytics/answer/12270356\">Measurement ID</a> (for web streams) or the <a href=\"https://developers.google.com/data-manager/api/devguides/concepts/destinations#ga-event\">Firebase App ID</a> (for app streams).\n<br/>"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "validateOnly",
        "displayName": "Validate Only",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": true,
            "displayValue": "true"
          },
          {
            "value": false,
            "displayValue": "false"
          }
        ],
        "simpleValueType": true,
        "help": "If <b>true</b>, the request is validated but not executed. Only errors are returned, not results.<br /> <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#request-body\">Learn more</a>.",
        "defaultValue": false
      },
      {
        "type": "SELECT",
        "name": "useOptimisticScenario",
        "displayName": "Use Optimistic Scenario",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": true,
            "displayValue": "true"
          },
          {
            "value": false,
            "displayValue": "false"
          }
        ],
        "simpleValueType": true,
        "help": "The tag will call gtmOnSuccess() without waiting for a response from the API. This will speed up sGTM response time however your tag will always return the status fired successfully even in case it is not.",
        "defaultValue": false
      },
      {
        "type": "GROUP",
        "name": "requestLevelConsentGroup",
        "displayName": "Request-level Consent",
        "groupStyle": "ZIPPY_OPEN_ON_PARAM",
        "subParams": [
          {
            "type": "LABEL",
            "name": "requestLevelConsentGroupLabel",
            "displayName": "Request-level consent to apply to all users in the request.\n<br/>\nUser-level consent overrides request-level consent, and can be specified for each conversion event when sending data to <i>Multiple Conversion Events</i> in the <b>Conversion Events</b> section.\n<br/><br/>"
          },
          {
            "type": "SELECT",
            "name": "adUserData",
            "displayName": "Consent for Ad User Data",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "CONSENT_GRANTED",
                "displayValue": "CONSENT_GRANTED"
              },
              {
                "value": "CONSENT_DENIED",
                "displayValue": "CONSENT_DENIED"
              },
              {
                "value": "CONSENT_STATUS_UNSPECIFIED",
                "displayValue": "CONSENT_STATUS_UNSPECIFIED"
              }
            ],
            "simpleValueType": true,
            "help": "This represents consent to Ad User Data. \n<br/><br/>\nWhen passing the value using a variable, make sure to return the exact strings (case insensitive) as defined below: \n<ul>\n<li>For consent granted: <i>CONSENT_GRANTED</i>, <i>GRANTED</i> or <i>TRUE</i></li>\n<li>For consent denied: <i>CONSENT_DENIED</i>, <i>DENIED</i> or <i>FALSE</i></li>\n<li>For consent unknown: <i>CONSENT_STATUS_UNSPECIFIED</i></li>\n</ul>",
            "notSetText": "(not set)"
          },
          {
            "type": "SELECT",
            "name": "adPersonalization",
            "displayName": "Consent for Ad Personalization",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "CONSENT_GRANTED",
                "displayValue": "CONSENT_GRANTED"
              },
              {
                "value": "CONSENT_DENIED",
                "displayValue": "CONSENT_DENIED"
              },
              {
                "value": "CONSENT_STATUS_UNSPECIFIED",
                "displayValue": "CONSENT_STATUS_UNSPECIFIED"
              }
            ],
            "simpleValueType": true,
            "help": "This represents consent to Ad Personalization.\n<br/><br/>\nWhen passing the value using a variable, make sure to return the exact strings (case insensitive) as defined below: \n<ul>\n<li>For consent granted: <i>CONSENT_GRANTED</i>, <i>GRANTED</i> or <i>TRUE</i></li>\n<li>For consent denied: <i>CONSENT_DENIED</i>, <i>DENIED</i> or <i>FALSE</i></li>\n<li>For consent unknown: <i>CONSENT_STATUS_UNSPECIFIED</i></li>\n</ul>",
            "notSetText": "(not set)"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "conversionEventsGroup",
        "displayName": "Conversion Events",
        "groupStyle": "ZIPPY_OPEN",
        "subParams": [
          {
            "type": "SELECT",
            "name": "userDataEncoding",
            "displayName": "User Data Encoding",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": "HEX",
                "displayValue": "HEX"
              },
              {
                "value": "BASE64",
                "displayValue": "BASE64"
              }
            ],
            "simpleValueType": true,
            "help": "The encoding type of the user identifiers SHA256 hash: <i>HEX</i> or <i>BASE64</i>.\n<br/><br/>\n<b>Required</b> for <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/UserData\"><i>UserData</i></a> (User Email Address, User Phone Number and User Given/Family Name) uploads.\n<br/>\nFor other types (User Address Region and User Address Postal Code) uploads, this field is <b>ignored</b>.\n<br/><br/>\nFor hashed user identifiers, this is the encoding type of the hashed string. \n<br/>\nFor encrypted hashed user identifiers, this is the encoding type of the outer encrypted string, but not necessarily the inner hashed string, meaning the inner hashed string could be encoded in a different way than the outer encrypted string.\n<br/><br/>\n<b>Default</b>: <i>HEX</i> - when passing a non-hashed value to <i>UserData</i> (User Email Address, User Phone Number and User Given/Family Name) fields; or when using default values from GA4 Event Data.",
            "notSetText": "(not set)"
          },
          {
            "type": "SELECT",
            "name": "enableUserDataEncryption",
            "displayName": "User Data Encryption",
            "macrosInSelect": true,
            "selectItems": [
              {
                "value": false,
                "displayValue": "false"
              },
              {
                "value": true,
                "displayValue": "true"
              }
            ],
            "simpleValueType": true,
            "help": "Encryption information for <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/UserData\"><i>UserData</i></a> (User Email Address, User Phone Number and User Given/Family Name) uploads.\n<br/><br/>\nIf not set, it's assumed that uploaded identifying information is hashed but not encrypted.\n<br/><br/> \nFor other types (User Address Region and User Address Postal Code) uploads, this field is <b>ignored</b>.\n<br/><br/>\nReferences:  \n<ul> \n<li><a href=\"https://developers.google.com/data-manager/api/get-started/encryption\">Data Manager API: Getting started with Encryption</a></li> <li><a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/EncryptionInfo\">EncryptionInfo object</a></li> </ul>",
            "defaultValue": false,
            "subParams": [
              {
                "type": "GROUP",
                "name": "userDataEncryptionInfoGroup",
                "displayName": "Encryption Info (Google Cloud Platform wrapped key information)",
                "groupStyle": "ZIPPY_OPEN_ON_PARAM",
                "subParams": [
                  {
                    "type": "SELECT",
                    "name": "gcpWrappedKeyType",
                    "displayName": "Key Type",
                    "macrosInSelect": false,
                    "selectItems": [
                      {
                        "value": "XCHACHA20_POLY1305",
                        "displayValue": "XCHACHA20_POLY1305"
                      }
                    ],
                    "simpleValueType": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ],
                    "help": "The type of algorithm used to encrypt the data."
                  },
                  {
                    "type": "TEXT",
                    "name": "gcpWrappedKeyWipProvider",
                    "displayName": "Workload Identity pool provider",
                    "simpleValueType": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ],
                    "help": "The <a href=\"https://cloud.google.com/iam/docs/workload-identity-federation\">Workload Identity</a> pool provider required to use KEK."
                  },
                  {
                    "type": "TEXT",
                    "name": "gcpWrappedKeyKekUri",
                    "displayName": "Google Cloud Platform Cloud Key Management Service resource ID",
                    "simpleValueType": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ],
                    "help": "The Google Cloud Platform <a href=\"https://cloud.google.com/kms/docs/getting-resource-ids\">Cloud Key Management Service resource ID</a>."
                  },
                  {
                    "type": "TEXT",
                    "name": "gcpWrappedKeyEncryptedDek",
                    "displayName": "Encrypted data encryption key",
                    "simpleValueType": true,
                    "help": "The base64 encoded encrypted data encryption key.",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "enableUserDataEncryption",
                    "paramValue": false,
                    "type": "NOT_EQUALS"
                  }
                ]
              }
            ]
          },
          {
            "type": "SELECT",
            "name": "conversionEventMode",
            "displayName": "Conversion Event Mode",
            "macrosInSelect": false,
            "selectItems": [
              {
                "value": "single",
                "displayValue": "Single Conversion Event (Recommended)"
              },
              {
                "value": "multiple",
                "displayValue": "Multiple Conversion Events"
              }
            ],
            "simpleValueType": true,
            "help": "Send data for a single conversion event or for multiple conversion events."
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "conversionEventsSingleGroup",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "GROUP",
            "name": "conversionInformationGroup",
            "displayName": "Conversion Information",
            "groupStyle": "ZIPPY_OPEN",
            "subParams": [
              {
                "type": "SELECT",
                "name": "autoMapConversionInformation",
                "displayName": "Auto-map Conversion Information",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n<br/><br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li>Transaction/Order ID: <i>eventData.transaction_id</i></li>\n<li>Currency: <i>eventData.currency</i>\n<li>Conversion Value:\n<ul>\n<li><i>eventData.value</i></li>\n<li>Sum of <i>eventData.items</i> or <i>eventData.ecommerce.items</i> Price * Quantity</li>\n</ul>\n</ul>",
                "defaultValue": true
              },
              {
                "type": "SELECT",
                "name": "eventSource",
                "displayName": "Event Source",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": "WEB",
                    "displayValue": "WEB"
                  },
                  {
                    "value": "APP",
                    "displayValue": "APP"
                  },
                  {
                    "value": "IN_STORE",
                    "displayValue": "IN_STORE (for Store Sales conversions)"
                  },
                  {
                    "value": "PHONE",
                    "displayValue": "PHONE"
                  },
                  {
                    "value": "OTHER",
                    "displayValue": "OTHER"
                  }
                ],
                "simpleValueType": true,
                "help": "<b>Required.</b>\n<br/><br/>\nA signal for where the event happened originally (web, app, in-store, etc.).\n<br/>\nGA4 events support only <i>WEB</i> and <i>APP</i>.",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "defaultValue": "WEB"
              },
              {
                "type": "TEXT",
                "name": "transactionId",
                "displayName": "Transaction/Order ID",
                "simpleValueType": true,
                "help": "The unique identifier for this event.\n<br/><br/>\n<b>Optional</b> when sending offline conversion or enhanced conversion for leads.\n<br/>\n<b>Required</b> when sending offline conversion as an additional data source to boost performance and data strength of an online conversion.\n<br/><br/>\n<a href=\"https://developers.google.com/data-manager/api/devguides/events\">Learn more.</a>"
              },
              {
                "type": "TEXT",
                "name": "eventTimestamp",
                "displayName": "Event Timestamp",
                "simpleValueType": true,
                "help": "<b>Required.</b>\n<br/><br/>\nThe time the event occurred.\n<br/><br/>\nThe supported formats are:\n<ul> \n<li>RFC 3339 compliant formats:\n<ul>\n<li>2014-10-02T15:01:23Z</li>\n<li>2014-10-02T15:01:23.045123456Z</li>\n<li>2014-10-02T15:01:23+05:30</li>\n</ul>\n</li> \n<li>Unix timestamp (in seconds or milliseconds)</li>\n</ul>\n<br/>\nIf not set, the tag will fallback to the current time if none is found."
              },
              {
                "type": "TEXT",
                "name": "lastUpdatedTimestamp",
                "displayName": "Last Updated Timestamp",
                "simpleValueType": true,
                "help": "The last time the event was updated.\n<br/><br/>\nThe supported formats are:\n<ul> \n<li>RFC 3339 compliant formats:\n<ul>\n<li>2014-10-02T15:01:23Z</li>\n<li>2014-10-02T15:01:23.045123456Z</li>\n<li>2014-10-02T15:01:23+05:30</li>\n</ul>\n</li> \n<li>Unix timestamp (in seconds or milliseconds)</li>\n</ul>"
              },
              {
                "type": "TEXT",
                "name": "currency",
                "displayName": "Currency",
                "simpleValueType": true,
                "help": "The currency code associated with all monetary values within this event.\n<br/><br/>\nThe value must be a recognized currency code as per <a href=\"http://en.wikipedia.org/wiki/ISO_4217\">ISO-4217 standard</a> (e.g. EUR, USD, etc.)."
              },
              {
                "type": "TEXT",
                "name": "conversionValue",
                "displayName": "Conversion Value",
                "simpleValueType": true,
                "help": "The conversion value associated with the event, for value-based conversions."
              },
              {
                "type": "TEXT",
                "name": "conversionCount",
                "displayName": "Conversion Quantity",
                "simpleValueType": true,
                "help": "For Floodlight conversions.\n<br/>\nThe conversion quantity or the number of items associated with the event, for counting-based conversions. Must be at least 1 for the conversion to count towards certain metrics (such as Total Conversions).",
                "enablingConditions": [
                  {
                    "paramName": "authFlow",
                    "paramValue": "own",
                    "type": "EQUALS"
                  }
                ]
              },
              {
                "type": "GROUP",
                "name": "googleAnalyticsConversionInformationGroup",
                "displayName": "Google Analytics Required Data",
                "groupStyle": "NO_ZIPPY",
                "subParams": [
                  {
                    "type": "SIMPLE_TABLE",
                    "name": "googleAnalyticsRequiredDataList",
                    "displayName": "Google Analytics Required Data",
                    "simpleTableColumns": [
                      {
                        "defaultValue": "",
                        "displayName": "Name",
                        "name": "name",
                        "type": "SELECT",
                        "isUnique": true,
                        "valueValidators": [
                          {
                            "type": "NON_EMPTY"
                          }
                        ],
                        "selectItems": [
                          {
                            "value": "eventName",
                            "displayValue": "Event Name"
                          },
                          {
                            "value": "userId",
                            "displayValue": "User ID"
                          },
                          {
                            "value": "clientId",
                            "displayValue": "Client ID (for web streams)"
                          },
                          {
                            "value": "appInstanceId",
                            "displayValue": "App Instance ID (for app streams)"
                          }
                        ]
                      },
                      {
                        "defaultValue": "",
                        "displayName": "Value",
                        "name": "value",
                        "type": "TEXT",
                        "valueValidators": [
                          {
                            "type": "NON_EMPTY"
                          }
                        ]
                      }
                    ],
                    "newRowButtonText": "Add Parameter",
                    "help": "<b>Event Name</b>\n<b>Required</b> if GA4 is a destination.<br/>The GA4 event name limitations and requirements apply. Learn more: <a href=\"https://support.google.com/analytics/answer/9267744\">[1]</a> and <a href=\"https://support.google.com/analytics/answer/13316687\">[2]</a>.\n<br/><br/>\n<b>User ID</b>\n<br/>\nThe unique identifier for a user. <a href=\"https://support.google.com/analytics/answer/9213390\">Learn more</a>.\n<br/><br/>\n<b>Client ID</b>\n<br/>\n<b>Required</b> if GA4 is a destination and a web stream will receive the event. <a href=\"https://developers.google.com/analytics/devguides/collection/protocol/ga4/reference/index.md?client_type=gtag#payload_post_body\">Learn more</a>.\n<br/><br/>\n<b>App Instance ID</b>\n<br/>\n<b>Required</b> if GA4 is a destination and an app stream will receive the event. <a href=\"https://developers.google.com/analytics/devguides/collection/protocol/ga4/reference/index.md?client_type=firebase#payload_post_body\">Learn more</a>."
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "authFlow",
                    "paramValue": "own",
                    "type": "EQUALS"
                  }
                ]
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "userDataGroup",
            "displayName": "User Data",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "LABEL",
                "name": "userDataGroupLabel",
                "displayName": "When sending User Data Identifiers, <b>at least one</b> of User Email Address(es), User Phone Number(s) or User Address must be specified.\nThe total number of User Data identifiers must not exceed 10 items.\n<br/>\n\u2757 Ensure you have accepted the <a href=\"https://support.google.com/adspolicy/answer/7475709\"><b>Customer Data Terms</b></a> and enabled <b>Enhanced Conversions</b> and <b>Enhanced Conversions for Leads</b> in Google Ads (<i>Goals > Conversions > Settings</i>) or CM360. These settings must be active for the destination account and its manager (MCC) account, if applicable.\n<br/><br/>"
              },
              {
                "type": "SELECT",
                "name": "autoMapUserData",
                "displayName": "Auto-map User Data Information",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n<br/><br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li>Email:\n<ul>\n<li><i>eventData.email</i></li>\n<li><i>eventData.email_address</i></li>\n<li><i>eventData.user_data.email</i></li>\n<li><i>eventData.user_data.email_address</i></li>\n<li><i>eventData.user_data.sha256_email_address</i></li>\n</ul>\n</li>\n<li>Phone:\n<ul>\n<li><i>eventData.phone</i></li>\n<li><i>eventData.phone_number</i></li>\n<li><i>eventData.user_data.phone</i></li>\n<li><i>eventData.user_data.phone_number</i></li>\n<li><i>eventData.user_data.sha256_phone_number</i></li>\n</ul>\n</li>\n<li>User Given Name:\n<ul>\n<li><i>eventData.user_data.address.first_name</i></li>\n<li><i>eventData.user_data.address.sha256_first_name</i></li>\n</ul>\n</li>\n<li>User Family Name:\n<ul>\n<li><i>eventData.user_data.address.last_name</i></li>\n<li><i>eventData.user_data.address.sha256_last_name</i></li>\n</ul>\n</li>\n<li>User Address Region:\n<ul>\n<li><i>eventData.user_data.address.country</i></li>\n</ul>\n</li>\n<li>User Address Postal Code:\n<ul>\n<li><i>eventData.user_data.address.postal_code</i></li>\n</ul>\n</li>\n</ul>",
                "defaultValue": true
              },
              {
                "type": "TEXT",
                "name": "userDataEmailAddresses",
                "displayName": "User Email Address(es)",
                "simpleValueType": true,
                "help": "Specify a single email address, or an array of email addresses. Each item can be already SHA256 hashed or not. They can be already encrypted as well.\n<br/><br/>\nIf already SHA256 hashed, make sure to follow these <a href=\"https://developers.google.com/data-manager/api/get-started/formatting#userdata_format\">normalization guidelines</a> before applying the hash, and also to <b>specify the hash encoding in the corresponding template field</b>.",
                "valueHint": "jane@example.com"
              },
              {
                "type": "TEXT",
                "name": "userDataPhoneNumbers",
                "displayName": "User Phone Number(s)",
                "simpleValueType": true,
                "help": "Specify a single phone number, or an array of phone numbers. Each item can be already SHA256 hashed or not. They can be already encrypted as well.\n<br/><br/>\nUse <a href=\"https://en.wikipedia.org/wiki/E.164\">E.164 format</a>. Include the plus sign (+) and the country code.\n<br/>\nIf already SHA256 hashed, make sure to follow these <a href=\"https://developers.google.com/data-manager/api/get-started/formatting#userdata_format\">normalization guidelines</a> before applying the hash, and also to <b>specify the hash encoding in the corresponding template field</b>.",
                "valueHint": "+1555999999999"
              },
              {
                "type": "CHECKBOX",
                "name": "addUserDataAddress",
                "checkboxText": "Add User Address data",
                "simpleValueType": true,
                "subParams": [
                  {
                    "type": "GROUP",
                    "name": "userDataAddressGroup",
                    "subParams": [
                      {
                        "type": "LABEL",
                        "name": "userDataAddressLabel",
                        "displayName": "You must specify <b>all</b> the fields below (User Given Name, User Family Name, User Address Region and User Address Postal Code)."
                      },
                      {
                        "type": "TEXT",
                        "name": "userDataAddressGivenName",
                        "displayName": "User Given Name",
                        "simpleValueType": true,
                        "help": "Specify the User Given Name (First Name). Don't include prefixes such as <i>Mrs.</i>. It can be already SHA256 hashed or not. It can be encrypted as well.\n<br/><br/>\nIf already SHA256 hashed, make sure to follow these <a href=\"https://developers.google.com/data-manager/api/get-started/formatting#userdata_format\">normalization guidelines</a> before applying the hash, and also to <b>specify the hash encoding in the corresponding template field</b>.",
                        "valueHint": "john",
                        "valueValidators": []
                      },
                      {
                        "type": "TEXT",
                        "name": "userDataAddressFamilyName",
                        "displayName": "User Family Name",
                        "simpleValueType": true,
                        "help": "Specify the User Family Name (Last Name). Don't include suffixes such as <i>Jr</i>. It can be already SHA256 hashed or not. It can be encrypted as well.\n<br/><br/>\nIf already SHA256 hashed, make sure to follow these <a href=\"https://developers.google.com/data-manager/api/get-started/formatting#userdata_format\">normalization guidelines</a> before applying the hash, and also to <b>specify the hash encoding in the corresponding template field</b>.",
                        "valueHint": "doe",
                        "valueValidators": []
                      },
                      {
                        "type": "TEXT",
                        "name": "userDataAddressRegion",
                        "displayName": "User Address Region",
                        "simpleValueType": true,
                        "help": "The 2-letter region code in <a href=\"https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2\">ISO-3166-1 alpha-2</a> of the user's address. Do not hash.",
                        "valueHint": "US",
                        "valueValidators": []
                      },
                      {
                        "type": "TEXT",
                        "name": "userDataAddressPostalCode",
                        "displayName": "User Address Postal Code",
                        "simpleValueType": true,
                        "help": "The postal code of the user's address. Do not hash.\n<br/>\nBoth US and international zip and postal codes are allowed. \n<br/>\nFor US addresses, use either 5 digits or 5 digits followed by a 4-digit extension. Using a 4-digit extension may improve your match rate.\n<br/>\nFor all other countries, don't use postal code extensions.",
                        "valueHint": "10001",
                        "valueValidators": []
                      }
                    ],
                    "enablingConditions": [
                      {
                        "paramName": "addUserDataAddress",
                        "paramValue": true,
                        "type": "EQUALS"
                      }
                    ],
                    "groupStyle": "NO_ZIPPY"
                  }
                ]
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "adIdentifiersGroup",
            "displayName": "Ad Identifiers",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SELECT",
                "name": "autoMapAdIdentifiersClickIds",
                "displayName": "Auto-map Click IDs",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map the <i>gclid</i>, <i>gbraid</i> and <i>wbraid</i> values using the following sources (in order):\n<ul>\n<li>Event Data</li>\n<li>URL Parameter</li>\n<li>Server Cookie</li>\n<li>JavaScript Cookie</li>\n</ul>\n<br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\n\u26a0\ufe0f Note that this feature might break if Google changes the format of the cookie values. Stape will do its best to keep up with the changes. \n<br/><br/>\nDefault mappings:\n<ul>\n  <li>gclid:\n    <ul>\n      <li><i>gclid</i> Event Data value</li>\n      <li><i>gclid</i> URL Parameter value</li>\n      <li><i>FPGCLAW</i> Event Data value</li>\n      <li><i>FPGCLAW</i> Common Cookie value</li>\n      <li><i>FPGCLAW</i> Server Cookie value</li>\n      <li><i>_gcl_aw</i> Event Data value</li>\n      <li><i>gcl_aw</i> Event Data value</li>\n      <li><i>_gcl_aw</i> Common Cookie value</li>\n      <li><i>_gcl_aw</i> JavaScript cookie value</li>\n    </ul>\n  </li>\n  <li>gbraid:\n    <ul>\n      <li><i>gbraid</i> Event Data value</li>\n      <li><i>gbraid</i> URL Parameter value</li>\n      <li><i>FPGCLAG</i> Event Data value</li>\n      <li><i>FPGCLAG</i> Common Cookie value</li>\n      <li><i>FPGCLAG</i> Server Cookie value</li>\n      <li><i>_gcl_ag</i> Event Data value</li>\n      <li><i>gcl_ag</i> Event Data value</li>\n      <li><i>_gcl_ag</i> Common Cookie value</li>\n      <li><i>_gcl_ag</i> JavaScript cookie value</li>\n    </ul>\n  </li>\n  <li>wbraid:\n    <ul>\n      <li><i>wbraid</i> Event Data value</li>\n      <li><i>wbraid</i> URL Parameter value</li>\n      <li><i>FPGCLGB</i> Event Data value</li>\n      <li><i>FPGCLGB</i> Common Cookie value</li>\n      <li><i>FPGCLGB</i> Server Cookie value</li>\n      <li><i>_gcl_gb</i> Event Data value</li>\n      <li><i>gcl_gb</i> Event Data value</li>\n      <li><i>_gcl_gb</i> Common Cookie value</li>\n      <li><i>_gcl_gb</i> JavaScript cookie value</li>\n    </ul>\n  </li>\n</ul>",
                "defaultValue": false
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersGclid",
                "displayName": "gclid",
                "simpleValueType": true,
                "help": "The Google Click ID (<i>gclid</i>) associated with this event.\n<br/>\nIt can also be used in GA4 if sending an event with a Transaction ID as an additional data source. <a href=\"https://developers.google.com/data-manager/api/devguides/events/analytics/online\"Learn more</a>."
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersGbraid",
                "displayName": "gbraid",
                "simpleValueType": true,
                "help": "The click identifier for clicks associated with app events and originating from iOS devices starting with iOS14."
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersWbraid",
                "displayName": "wbraid",
                "simpleValueType": true,
                "help": "The click identifier for clicks associated with web events and originating from iOS devices starting with iOS14."
              },
              {
                "type": "GROUP",
                "name": "floodlightAdIdentifiersGroup",
                "displayName": "",
                "groupStyle": "NO_ZIPPY",
                "subParams": [
                  {
                    "type": "TEXT",
                    "name": "adIdentifiersDclid",
                    "displayName": "dclid",
                    "simpleValueType": true,
                    "help": "For Floodlight conversions.\n<br/>\nThe Display Click ID (for Floodlight conversions) associated with this event."
                  },
                  {
                    "type": "TEXT",
                    "name": "adIdentifiersMatchId",
                    "displayName": "Match ID",
                    "simpleValueType": true,
                    "help": "For Floodlight conversions.\n<br/>\nThe Match ID field used to join this event with a previous event."
                  },
                  {
                    "type": "TEXT",
                    "name": "adIdentifiersImpressionId",
                    "displayName": "Impression ID",
                    "simpleValueType": true,
                    "help": "For Floodlight conversions.\n<br/>\nThe Impression ID associated with this event."
                  },
                  {
                    "type": "TEXT",
                    "name": "adIdentifiersEncryptedUserId",
                    "displayName": "Encrypted User ID",
                    "simpleValueType": true,
                    "help": "For Floodlight conversions.\n<br/>\nAn array of objects containing an user identifier issued to be used for attribution.\n<br/>\nLearn more: <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#adidentifiers\">[1]</a> and <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#encrypteduserid\">[2]</a>."
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "authFlow",
                    "paramValue": "own",
                    "type": "EQUALS"
                  }
                ]
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersMobileDeviceId",
                "displayName": "Mobile Device ID",
                "simpleValueType": true,
                "help": "The mobile identifier for advertisers. This would be IDFA on iOS, AAID/GAID on Android, or other platforms\u2019 identifiers for advertisers."
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersLandingPageDeviceInfoUserAgent",
                "displayName": "Landing Page User Agent",
                "simpleValueType": true,
                "help": "Information gathered about the device's user agent being used (if any) at the time of landing onto the advertiser\u2019s site after interacting with the ad."
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersLandingPageDeviceInfoIpAddress",
                "displayName": "Landing Page IP Address",
                "simpleValueType": true,
                "help": "Information gathered about the device's IP address being used (if any) at the time of landing onto the advertiser\u2019s site after interacting with the ad.\n<br/><br/>\n<b>Note:</b> Google Ads does not support IP address matching for end users in the European Economic Area (EEA), United Kingdom (UK), or Switzerland (CH). Add logic to conditionally exclude sharing IP addresses from users from these regions and ensure that you provide users with clear and comprehensive information about the data you collect on your sites, apps, and other properties and get consent where required by law or any applicable Google policies. See the <a href=\"https://support.google.com/google-ads/answer/2998031\">About offline conversion imports page</a> for more details."
              },
              {
                "type": "SELECT",
                "name": "autoMapAdIdentifiersSessionAttributes",
                "displayName": "Auto-map Session Attributes",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map the <i>Session Attributes</i> from, in this order: \n<ul>\n<li><i>session_attributes</i> Event Data value</li>\n<li> <i>_dm_session_attributes</i> Common Cookie value </li> \n<li><i>_dm_session_attributes</i> cookie set by the Pageview event</li>\n</ul>\n<br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li>Session Attribute <i>gad_source</i>: <i>gad_source</i> URL Parameter value </li>\n<li>Session Attribute <i>gad_campaignid</i>: <i>gad_campaignid</i> URL Parameter value</li>\n<li>Session Attribute <i>landing_page_url</i>: <i>page_location</i> Event Data value</li>\n<li>Session Attribute <i>landing_page_referrer</i>: <i>page_referrer</i> Event Data value</li></li>\n<li>Session Attribute <i>landing_page_user_agent</i>: <i>user_agent</i> Event Data value</li></li>\n<li>Session Attribute <i>session_start_time_usec</i>: current timestamp of the time when the Pageview tag set the cookie</li>\n</ul>\n<br/>\nLearn more: <a href=\"https://support.google.com/google-ads/answer/16194756?hl=en\">[1]</a> and <a href=\"https://ads-developers.googleblog.com/2025/08/maximize-performance-of-your-google-ads.html\">[2]</a>.",
                "defaultValue": true
              },
              {
                "type": "TEXT",
                "name": "adIdentifiersSessionAttributes",
                "displayName": "Session Attributes String",
                "simpleValueType": true,
                "help": "Session attributes string for conversion event attribution and modeling.\n<br/>\nLearn more: <a href=\"https://support.google.com/google-ads/answer/16194756?hl=en\">[1]</a> and <a href=\"https://ads-developers.googleblog.com/2025/08/maximize-performance-of-your-google-ads.html\">[2]</a>."
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "eventDeviceInfoGroup",
            "displayName": "Event Device Information",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SELECT",
                "name": "autoMapEventDeviceInfo",
                "displayName": "Auto-map Event Device Information",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n<br/><br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li>User Agent: <i>eventData.user_agent</i></li>\n<li>IP Address: <i>eventData.ip_override</i></li>\n<li>Screen Width: <i>eventData.screen_resolution.split('x')[0]</i></li>\n<li>Screen Height: <i>eventData.screen_resolution.split('x')[1]</i></li>\n</ul>",
                "defaultValue": true
              },
              {
                "type": "TEXT",
                "name": "eventDeviceInfoUserAgent",
                "displayName": "User Agent",
                "simpleValueType": true,
                "help": "Information gathered about the device's user agent being used (if any) when the event happened."
              },
              {
                "type": "TEXT",
                "name": "eventDeviceInfoIpAddress",
                "displayName": "IP Address",
                "simpleValueType": true,
                "help": "Information gathered about the device's IP address being used (if any) when the event happened.\n<br/><br/>\n<b>Note:</b> Google Ads does not support IP address matching for end users in the European Economic Area (EEA), United Kingdom (UK), or Switzerland (CH). Add logic to conditionally exclude sharing IP addresses from users from these regions and ensure that you provide users with clear and comprehensive information about the data you collect on your sites, apps, and other properties and get consent where required by law or any applicable Google policies. See the <a href=\"https://support.google.com/google-ads/answer/2998031\">About offline conversion imports page</a> for more details."
              },
              {
                "type": "SIMPLE_TABLE",
                "name": "eventDeviceInfoList",
                "displayName": "Event Device Information",
                "simpleTableColumns": [
                  {
                    "defaultValue": "",
                    "displayName": "Property Name",
                    "name": "name",
                    "type": "SELECT",
                    "selectItems": [
                      {
                        "value": "category",
                        "displayValue": "Category"
                      },
                      {
                        "value": "languageCode",
                        "displayValue": "Language Code"
                      },
                      {
                        "value": "screenHeight",
                        "displayValue": "Screen Height"
                      },
                      {
                        "value": "screenWidth",
                        "displayValue": "Screen Width"
                      },
                      {
                        "value": "operatingSystem",
                        "displayValue": "Operating System"
                      },
                      {
                        "value": "operatingSystemVersion",
                        "displayValue": "Operating System Version"
                      },
                      {
                        "value": "model",
                        "displayValue": "Model"
                      },
                      {
                        "value": "brand",
                        "displayValue": "Brand"
                      },
                      {
                        "value": "browser",
                        "displayValue": "Browser"
                      },
                      {
                        "value": "browserVersion",
                        "displayValue": "Browser Version"
                      }
                    ],
                    "isUnique": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Property Value",
                    "name": "value",
                    "type": "TEXT",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  }
                ],
                "help": "<a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#deviceinfo\">Learn more</a>.",
                "newRowButtonText": "Add Property"
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "userPropertiesGroup",
            "displayName": "User Properties",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SELECT",
                "name": "userPropertiesCustomerType",
                "displayName": "Customer Type",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": "NEW",
                    "displayValue": "NEW"
                  },
                  {
                    "value": "RETURNING",
                    "displayValue": "RETURNING"
                  },
                  {
                    "value": "REENGAGED",
                    "displayValue": "REENGAGED"
                  }
                ],
                "simpleValueType": true,
                "help": "Type of the customer associated with the event.",
                "notSetText": "(not set)"
              },
              {
                "type": "SELECT",
                "name": "userPropertiesCustomerValueBucket",
                "displayName": "Customer Value Bucket",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": "LOW",
                    "displayValue": "LOW"
                  },
                  {
                    "value": "MEDIUM",
                    "displayValue": "MEDIUM"
                  },
                  {
                    "value": "HIGH",
                    "displayValue": "HIGH"
                  }
                ],
                "simpleValueType": true,
                "help": "The advertiser-assessed value of the customer.",
                "notSetText": "(not set)"
              },
              {
                "type": "GROUP",
                "name": "googleAnalyticsUserPropertiesGroup",
                "displayName": "Google Analytics User Properties",
                "groupStyle": "NO_ZIPPY",
                "subParams": [
                  {
                    "type": "SIMPLE_TABLE",
                    "name": "userPropertiesList",
                    "displayName": "User Properties",
                    "simpleTableColumns": [
                      {
                        "defaultValue": "",
                        "displayName": "User Property Name",
                        "name": "name",
                        "type": "TEXT",
                        "isUnique": true,
                        "valueValidators": [
                          {
                            "type": "NON_EMPTY"
                          }
                        ]
                      },
                      {
                        "defaultValue": "",
                        "displayName": "User Property Value",
                        "name": "value",
                        "type": "TEXT",
                        "valueValidators": [
                          {
                            "type": "NON_EMPTY"
                          }
                        ]
                      }
                    ],
                    "newRowButtonText": "Add User Property",
                    "help": "<a href=\"https://developers.google.com/analytics/devguides/collection/protocol/ga4/user-properties\">Learn more</a>."
                  }
                ],
                "enablingConditions": [
                  {
                    "paramName": "authFlow",
                    "paramValue": "own",
                    "type": "EQUALS"
                  }
                ]
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "cartDataGroup",
            "displayName": "Cart Data",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SELECT",
                "name": "autoMapCartData",
                "displayName": "Auto-map Cart Data",
                "macrosInSelect": true,
                "selectItems": [
                  {
                    "value": true,
                    "displayValue": "true"
                  },
                  {
                    "value": false,
                    "displayValue": "false"
                  }
                ],
                "simpleValueType": true,
                "help": "If enabled, the tag will attempt to automatically map parameters from the Event Data.\n<br/><br/>\nAny value you manually enter in a field below will always override the auto-mapped value.\n<br/><br/>\nDefault mappings:\n<ul>\n<li>Items: <i>eventData.items</i> and <i>eventData.ecommerce.items</i>. It only auto-maps items that have an <i>Item ID</i>. Auto-mapped properties: <i>itemId</i>, <i>merchantProductId</i> (same as Item ID), <i>quantity</i> and <i>unitPrice</i>. If the <i>Add other Item Parameters</i> checkbox below is enabled, any other item property is also mapped to <i>additionalItemParameters</i> for GA4 (and to <i>customVariables</i> for Google Ads Store Sales conversions).</li>\n<li>Coupon Codes: <i>eventData.coupon</i></li>\n</ul>",
                "defaultValue": true,
                "subParams": [
                  {
                    "type": "TEXT",
                    "name": "itemIdKey",
                    "displayName": "Custom Item ID Key",
                    "simpleValueType": true,
                    "help": "Optional. <br/><br/> You can specify a custom key, which will be used to set the content Item ID, by default <i>item_id</i> will be used. This may be useful if you are using WooCommerce extensions.",
                    "enablingConditions": [
                      {
                        "paramName": "autoMapCartData",
                        "paramValue": false,
                        "type": "NOT_EQUALS"
                      }
                    ]
                  }
                ]
              },
              {
                "type": "TEXT",
                "name": "cartDataMerchantId",
                "displayName": "Merchant Center Account ID",
                "simpleValueType": true,
                "help": "The Merchant Center Account ID.\n<br/><br/>\nThis is located in the top-left corner under your account name. \n<br/>\nAlternatively, you can find it in the URL as the value for the <i>a={Account ID}</i> parameter."
              },
              {
                "type": "TEXT",
                "name": "cartDataMerchantFeedLabel",
                "displayName": "Merchant Center Feed Label",
                "simpleValueType": true,
                "help": "The Merchant Center feed label associated with the feed of the items.\n<br/><br/>\nYou can find it in the URL while editing a product in Merchant Center (e.g., <i>feedLabel=DK</i>). \n<br/>\nAlternatively, add the <b>Feed Label</b> column to your product table overview to see this value directly."
              },
              {
                "type": "TEXT",
                "name": "cartDataMerchantFeedLanguageCode",
                "displayName": "Merchant Center Feed Language Code",
                "simpleValueType": true,
                "help": "The language code in ISO 639-1 associated with the Merchant Center feed of the items.where your items are uploaded.\n<br/><br/>\nYou can find it in the URL while editing a product in Merchant Center (e.g., <i>language=da</i>). \n<br/>\nAlternatively, add the <b>Feed Language</b> column to your product table overview to see this value directly."
              },
              {
                "type": "TEXT",
                "name": "cartDataTransactionDiscount",
                "displayName": "Transaction Discount",
                "simpleValueType": true,
                "help": "The sum of all discounts associated with the transaction/conversion."
              },
              {
                "type": "TEXT",
                "name": "cartDataCouponCodes",
                "displayName": "Cart-level Coupon Codes",
                "simpleValueType": true,
                "help": "The coupon codes that were applied to the cart. Cart-level and item-level coupon codes are independent.\n<br/>\nSpecify a single coupon code, or an array of coupon codes."
              },
              {
                "type": "CHECKBOX",
                "name": "addAdditionalItemParameters",
                "checkboxText": "Add other Item Parameters in Additional Item Parameters (for GA4) and Custom Variables (for Google Ads Store Sales only).",
                "simpleValueType": true,
                "help": "If enabled, any item property that is not <i>merchantProductId</i>, <i>itemId</i>, <i>quantity</i> or <i>unitPrice</i> will also be added, per item, to <i>additionalItemParameters</i> (used by Google Analytics) and <i>customVariables</i> (used by Google Ads and Floodlight).",
                "defaultValue": false
              },
              {
                "type": "TEXT",
                "name": "cartDataItems",
                "displayName": "Items",
                "simpleValueType": true,
                "help": "The array of items associated with the event.\n<br/>\nEach item in the array is an object that must follow the <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#item\">Item</a> object guidelines and supported properties.\n<br/><br/>\nSupported properties: \n<ul>\n<li><i>itemId</i></li>\n<li><i>merchantProductId</i></li>\n<li><i>quantity</i></li>\n<li><i>unitPrice</i></li>\n<li><i>merchantId</i></li>\n<li><i>merchantFeedLabel</i></li>\n<li><i>merchantFeedLanguageCode</i></li>\n<li><i>conversionValue</i></li>\n<li><i>additionalItemParameters</i> (for GA4) and <i>customVariables</i> (the latter, only for Google Ads Store Sales conversions)</li>\n</ul>\n<br/>\nIf an item has neither an <i>itemId</i> nor a <i>merchantProductId</i> property, it won't be included in the array."
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "customVariablesGroup",
            "displayName": "Custom Variables",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SIMPLE_TABLE",
                "name": "customVariablesList",
                "simpleTableColumns": [
                  {
                    "defaultValue": "",
                    "displayName": "Custom Variable ID",
                    "name": "name",
                    "type": "TEXT",
                    "isUnique": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      },
                      {
                        "type": "POSITIVE_NUMBER"
                      }
                    ],
                    "valueHint": "123456"
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Custom Variable Value",
                    "name": "value",
                    "type": "TEXT",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Destination References",
                    "name": "destinationReferences",
                    "type": "TEXT"
                  }
                ],
                "newRowButtonText": "Add Custom Variable",
                "help": "<a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#customvariable\">Learn more</a> about Custom Variables.\n<br/>\n<a href=\"https://github.com/stape-io/google-conversion-events-tag?tab=readme-ov-file#how-to-obtain-the-variable-id\">Learn more</a> about how to obtain the <i>Custom Variable ID</i>.\n<br/>\nIn the optional <i>Destination References</i> column, you may leave it blank, or specify either a single reference or an array of references.",
                "displayName": "Custom Variables"
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "eventLocationGroup",
            "displayName": "Event Location",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SIMPLE_TABLE",
                "name": "eventLocationList",
                "displayName": "Event Location",
                "simpleTableColumns": [
                  {
                    "defaultValue": "",
                    "displayName": "Property Name",
                    "name": "name",
                    "type": "SELECT",
                    "selectItems": [
                      {
                        "value": "storeId",
                        "displayValue": "Store ID (for Store Sales)"
                      },
                      {
                        "value": "city",
                        "displayValue": "City"
                      },
                      {
                        "value": "subdivisionCode",
                        "displayValue": "Subdivision Code"
                      },
                      {
                        "value": "regionCode",
                        "displayValue": "Region Code (Country Code)"
                      },
                      {
                        "value": "subcontinentCode",
                        "displayValue": "Subcontinent Code"
                      },
                      {
                        "value": "continentCode",
                        "displayValue": "Continent Code"
                      }
                    ],
                    "isUnique": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Property Value",
                    "name": "value",
                    "type": "TEXT",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  }
                ],
                "help": "The location where the event occurred. \n<br/>\nUseful for Store Sales conversions for Google Ads, or for adding geographical information to a Google Analytics event.\n<br/>\n<a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#eventlocation\">Learn more</a>.",
                "newRowButtonText": "Add Property"
              }
            ]
          },
          {
            "type": "GROUP",
            "name": "additionalEventParametersGroup",
            "displayName": "Google Analytics Event Parameters",
            "groupStyle": "ZIPPY_OPEN_ON_PARAM",
            "subParams": [
              {
                "type": "SIMPLE_TABLE",
                "name": "additionalEventParametersList",
                "displayName": "Google Analytics Event Parameters",
                "simpleTableColumns": [
                  {
                    "defaultValue": "",
                    "displayName": "Field Name",
                    "name": "name",
                    "type": "TEXT",
                    "isUnique": true,
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  },
                  {
                    "defaultValue": "",
                    "displayName": "Field Value",
                    "name": "value",
                    "type": "TEXT",
                    "valueValidators": [
                      {
                        "type": "NON_EMPTY"
                      }
                    ]
                  }
                ],
                "newRowButtonText": "Add Parameter",
                "help": "Populate this list with any Google Analytics event parameters that aren't captured in the other fields. The parameters can include <a href=\"https://developers.google.com/data-manager/api/reference/analytics/recommended-events\">additional recommended parameters</a> for the event or any other parameters you want to capture.\n<br/>\nLearn more: <a href=\"https://developers.google.com/data-manager/api/devguides/events/send-events#add_analytics_info\">[1]</a>, <a href=\"https://developers.google.com/analytics/devguides/collection/protocol/ga4/reference/events\">[2]</a> and <a href=\"https://support.google.com/analytics/answer/9267744?hl=en\">[3]</a>."
              }
            ],
            "enablingConditions": [
              {
                "paramName": "authFlow",
                "paramValue": "own",
                "type": "EQUALS"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "conversionEventMode",
            "paramValue": "single",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "conversionEventsMultipleGroup",
        "subParams": [
          {
            "type": "TEXT",
            "name": "conversionEvents",
            "displayName": "Conversion Events Array",
            "simpleValueType": true,
            "help": "Specify the Conversion Events array. This is useful when you need to upload data for multiple conversion events at once. At most 2000 Conversion Events can be specified in the array.\n<br/><br/>\nThe array must be formatted as specified in the\nGoogle Documentation. You can specify different consent types for each Conversion Event, overriding the request-level consent.\n<br/><br/>\n<b>If you already pass SHA256 hashed fields to <a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/UserData\"><i>UserData</i></a> field, make sure to specify the SHA256 hash encoding in the corresponding template field. Otherwise, the tag will hash it automatically and set it for you.</b>\n<br/><br/>\nWhen working with multiple Conversion Event IDs, you can direct an event to a specific subset of them. To do so, list the desired Conversion Event IDs in the <a target=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#event\"><i>destinationReferences</i></a> array.\n<br/><br/>\nReferences: \n<ul>\n<li><a href=\"https://developers.google.com/data-manager/api/reference/rest/v1/events/ingest#Event\">Conversion Event</a></li>\n<li><a href=\"https://developers.google.com/data-manager/api/get-started/formatting\">Normalization guidelines</a></li>\n<li><a href=\"https://developers.google.com/data-manager/api/get-started/quickstart/send-events?persona=advertiser#build_the_request_body\">Example</a></li>\n</ul>",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "conversionEventMode",
            "paramValue": "multiple",
            "type": "EQUALS"
          }
        ],
        "groupStyle": "NO_ZIPPY"
      },
      {
        "type": "GROUP",
        "name": "ownConnectionSettings",
        "displayName": "Own Connection Settings",
        "groupStyle": "ZIPPY_CLOSED",
        "subParams": [
          {
            "type": "TEXT",
            "name": "xGoogUserProject",
            "displayName": "X-Goog-User-Project header",
            "simpleValueType": true,
            "help": "A request header that specifies the GCP project to bill for access charges associated with the request.\n<a href=\"https://docs.cloud.google.com/storage/docs/json_api/v1/parameters#xgooguserproject\">Learn more.</a>"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "authFlow",
            "paramValue": "own",
            "type": "EQUALS"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "pageview",
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "tagExecutionConsentSettingsGroup",
    "displayName": "Tag Execution Consent Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "RADIO",
        "name": "adStorageConsent",
        "displayName": "",
        "radioItems": [
          {
            "value": "optional",
            "displayValue": "Send data always"
          },
          {
            "value": "required",
            "displayValue": "Send data in case marketing consent given",
            "help": "Aborts the tag execution if marketing consent (<i>ad_storage</i> Google Consent Mode or Stape's Data Tag parameter) is not given."
          }
        ],
        "simpleValueType": true,
        "defaultValue": "optional"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "powerclickGroup",
    "displayName": "PowerClick",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "clicksporeTenantId",
        "displayName": "PowerClick Tenant ID",
        "simpleValueType": true,
        "help": "Your PowerClick tenant id. Required \u2014 without it the CAPI response is not logged to PowerClick."
      },
      {
        "type": "TEXT",
        "name": "customEventName",
        "displayName": "PowerClick Event Name (optional)",
        "simpleValueType": true,
        "help": "Overrides the event name shown in PowerClick (e.g. 'Purchase'). Blank = the platform event name."
      },
      {
        "type": "TEXT",
        "name": "sporeId",
        "displayName": "PowerClick Spore ID fallback (optional)",
        "simpleValueType": true,
        "help": "Tried LAST. Map a store-backed variable (e.g. {{sjo.spore_id(coalesce)}}) ONLY on cross-domain checkout/purchase tags, where the __spore_id cookie and storefront event data are gone. Leave blank elsewhere."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const computeEffectiveTldPlusOne = require('computeEffectiveTldPlusOne');
const createRegex = require('createRegex');
const encodeUriComponent = require('encodeUriComponent');
const getAllEventData = require('getAllEventData');
const getCookieValues = require('getCookieValues');
const getEventData = require('getEventData');
const getGoogleAuth = require('getGoogleAuth');
const getRequestHeader = require('getRequestHeader');
const getTimestampMillis = require('getTimestampMillis');
const getType = require('getType');
const JSON = require('JSON');
const logToConsole = require('logToConsole');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const Math = require('Math');
const parseUrl = require('parseUrl');
const Object = require('Object');
const sendHttpRequest = require('sendHttpRequest');
const queryPermission = require('queryPermission');
// Ingest host. ingest.powerclick.io when this template's "Sends HTTP requests" permission allows it,
// otherwise the legacy ingest host. Both hosts run the same Cloudflare ingest worker, so the
// template works under either permission set and a container moves domains by adding the permission —
// never by a code change. (queryPermission needs no permission of its own.)
const POWERCLICK_INGEST = queryPermission('send_http', 'https://ingest.powerclick.io/api/ingest')
  ? 'https://ingest.powerclick.io/api/ingest'
  : 'https://ingest.clickspore.io/api/ingest';
const setCookie = require('setCookie');
const sha256Sync = require('sha256Sync');
const toBase64 = require('toBase64');

/*==============================================================================
==============================================================================*/

const API_VERSION = '1';
const eventData = getAllEventData();
const useOptimisticScenario = isUIFieldTrue(data.useOptimisticScenario);

if (shouldExitEarly(data, eventData)) {
  return data.gtmOnSuccess();
}

const actionHandlers = {
  pageview: handlePageViewEvent,
  conversion: handleConversionEvent
};

const handler = actionHandlers[data.eventType || 'conversion'];
if (handler) {
  const error = handler(data, eventData);
  if (error) return;
} else {
  return data.gtmOnFailure();
}

if (useOptimisticScenario) {
  return data.gtmOnSuccess();
}

/*==============================================================================
  Vendor related functions
==============================================================================*/

function createSessionAttributesBase64String(sessionAttributes) {
  let sessionAttributesBase64 = toBase64(JSON.stringify(sessionAttributes));

  // Attempt to reduce the payload size if it exceeds the 4000-character limit.
  const keysToRemove = ['landing_page_referrer', 'landing_page_user_agent'];
  for (const key of keysToRemove) {
    if (sessionAttributesBase64.length <= 4000) break;
    sessionAttributes[key] = undefined;
    sessionAttributesBase64 = toBase64(JSON.stringify(sessionAttributes));
  }
  if (sessionAttributesBase64.length > 4000) return;

  const plusSignRegex = createRegex('\\+', 'g');
  const forwardSlashRegex = createRegex('\\/', 'g');
  const equalSignSuffixRegex = createRegex('=+$', 'g');
  return sessionAttributesBase64
    .replace(plusSignRegex, '-')
    .replace(forwardSlashRegex, '_')
    .replace(equalSignSuffixRegex, '');
}

function handlePageViewEvent(data, eventData) {
  const url = getUrl(eventData);
  if (!url) {
    data.gtmOnSuccess();
    return;
  }

  // Ref: https://support.google.com/google-ads/answer/16194756

  const urlSearchParams = parseUrl(url).searchParams;
  const urlSearchParamsKeys = Object.keys(urlSearchParams);
  const hasAdsParams = urlSearchParamsKeys.some((key) => {
    return (
      (key.indexOf('gad_') === 0 || key === 'gclid' || key === 'gbraid') && urlSearchParams[key]
    );
  });

  if (!hasAdsParams) {
    data.gtmOnSuccess();
    return;
  }

  const sessionAttributes = {};
  urlSearchParamsKeys.forEach((key) => {
    if (key.indexOf('gad_') === 0) sessionAttributes[key] = urlSearchParams[key];
  });
  sessionAttributes.session_start_time_usec = makeString(getTimestampMillis() * 1000);
  if (eventData.page_location) sessionAttributes.landing_page_url = eventData.page_location;
  if (eventData.page_referrer) sessionAttributes.landing_page_referrer = eventData.page_referrer;
  if (eventData.user_agent) sessionAttributes.landing_page_user_agent = eventData.user_agent;

  let sessionAttributesBase64 = createSessionAttributesBase64String(sessionAttributes);
  if (!sessionAttributesBase64) {
    log({
      Name: 'GoogleConversionEvent',
      Type: 'Message',
      EventName: 'PageviewEvent',
      Message: '⚠️ [WARNING] Cookie was not set.',
      Reason: 'Session attributes base64 cookie is bigger than 4000 characters.'
    });
    data.gtmOnFailure();
    return true;
  }

  const cookieOptions = {
    domain: getCookieDomain(data),
    samesite: data.cookieSameSite || 'none',
    path: '/',
    secure: true,
    httpOnly: !!data.cookieHttpOnly,
    'max-age': 60 * 60 * 24 * (makeInteger(data.cookieExpiration) || 90)
  };
  setCookie('_dm_session_attributes', sessionAttributesBase64, cookieOptions, false);

  data.gtmOnSuccess();
  return;
}

function addDestinationsData(data, mappedData) {
  const normalizeIds = (id, isGADestinationId) => {
    return !isGADestinationId ? replaceAll(makeString(id), '[^0-9]', '') : makeString(id).trim();
  };

  const destinations = [];
  const accountsAndDestinationsFromUI =
    data.stapeAuthDestinationsList || data.ownAuthDestinationsList; // Mutually exclusive.

  accountsAndDestinationsFromUI.forEach((row) => {
    const productDestinationId = normalizeIds(
      row.productDestinationId,
      row.product === 'GOOGLE_ANALYTICS_PROPERTY'
    );
    const destination = {
      reference: productDestinationId,
      productDestinationId: productDestinationId,
      operatingAccount: {
        accountType: row.product,
        accountId: normalizeIds(row.operatingAccountId)
      }
    };

    if (data.authFlow === 'stape' && row.linkedAccountId) {
      destination.linkedAccount = {
        accountType: row.product,
        accountId: normalizeIds(row.linkedAccountId)
      };
    }

    if (data.authFlow === 'own' && row.loginAccountId) {
      destination.loginAccount = {
        accountType: row.product,
        accountId: normalizeIds(row.loginAccountId)
      };
    }

    destinations.push(destination);
  });

  mappedData.destinations = destinations;

  return mappedData;
}

function addConsentData(data, mappedData) {
  const consent = {};
  const consentTypes = ['adUserData', 'adPersonalization'];

  consentTypes.forEach((consentType) => {
    if (!data[consentType]) return;
    switch (makeString(data[consentType]).toUpperCase()) {
      case 'CONSENT_GRANTED':
      case 'TRUE':
      case 'GRANTED':
        consent[consentType] = 'CONSENT_GRANTED';
        break;
      case 'CONSENT_DENIED':
      case 'FALSE':
      case 'DENIED':
        consent[consentType] = 'CONSENT_DENIED';
        break;
      case 'CONSENT_STATUS_UNSPECIFIED':
        consent[consentType] = 'CONSENT_STATUS_UNSPECIFIED';
      default:
        return;
    }
    mappedData.consent = consent;
  });

  return mappedData;
}

function getEmailAddressesFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};

  let email =
    eventDataUserData.email ||
    eventDataUserData.email_address ||
    eventDataUserData.sha256_email ||
    eventDataUserData.sha256_email_address;

  const emailType = getType(email);

  if (emailType === 'string') email = [email];
  else if (emailType === 'array') email = email.length > 0 ? email : undefined;
  else if (emailType === 'object') {
    const emailsFromObject = Object.values(email);
    if (emailsFromObject.length) email = emailsFromObject;
  }

  return email;
}

function getPhoneNumbersFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};

  let phone =
    eventDataUserData.phone ||
    eventDataUserData.phone_number ||
    eventDataUserData.sha256_phone_number;

  const phoneType = getType(phone);

  if (phoneType === 'string') phone = [phone];
  else if (phoneType === 'array') phone = phone.length > 0 ? phone : undefined;
  else if (phoneType === 'object') {
    const phonesFromObject = Object.values(phone);
    if (phonesFromObject.length) phone = phonesFromObject;
  }

  return phone;
}

function getAddressFromEventData(eventData) {
  const eventDataUserData = eventData.user_data || {};
  let eventDataUserDataAddress = {};
  const addressType = getType(eventDataUserData.address);
  if (addressType === 'object' || addressType === 'array') {
    eventDataUserDataAddress = eventDataUserData.address[0] || eventDataUserData.address;
  }

  const firstName =
    eventDataUserDataAddress.first_name || eventDataUserDataAddress.sha256_first_name;
  const lastName = eventDataUserDataAddress.last_name || eventDataUserDataAddress.sha256_last_name;
  const postalCode = eventDataUserDataAddress.postal_code;
  const regionCode = eventDataUserDataAddress.country;

  if (firstName && lastName && postalCode && regionCode) {
    return {
      givenName: makeString(firstName),
      familyName: makeString(lastName),
      postalCode: makeString(postalCode),
      regionCode: makeString(regionCode)
    };
  }
}

function addConversionInformation(data, eventData, conversionEvent) {
  const getValueFromItems = (eventData) => {
    const items = getItems(eventData);
    if (getType(items) !== 'array' || items.length === 0) return;

    let valueFromItems = 0;
    items.forEach((i) => {
      if (!isValidValue(i.price)) return;
      const itemPrice = makeNumber(i.price);
      const itemQuantity = makeInteger(i.quantity);
      valueFromItems += itemQuantity ? itemQuantity * itemPrice : itemPrice;
    });

    return valueFromItems;
  };

  if (isUIFieldTrue(data.autoMapConversionInformation)) {
    if (eventData.transaction_id) {
      conversionEvent.transactionId = makeString(eventData.transaction_id);
    }

    if (eventData.currency) conversionEvent.currency = eventData.currency;

    const conversionValue = eventData.value || getValueFromItems(eventData);
    if (isValidValue(conversionValue)) conversionEvent.conversionValue = conversionValue;
  }

  if (data.eventSource) conversionEvent.eventSource = data.eventSource;

  if (data.transactionId) conversionEvent.transactionId = makeString(data.transactionId);

  if (data.eventTimestamp) {
    conversionEvent.eventTimestamp = getConversionDateTime(data.eventTimestamp);
  } else conversionEvent.eventTimestamp = getConversionDateTime();

  if (data.lastUpdatedTimestamp) {
    conversionEvent.lastUpdatedTimestamp = getConversionDateTime(data.lastUpdatedTimestamp);
  }

  if (data.currency) conversionEvent.currency = data.currency;

  if (isValidValue(data.conversionValue)) {
    conversionEvent.conversionValue = makeNumber(data.conversionValue);
  }

  if (isValidValue(data.conversionCount)) {
    conversionEvent.conversionCount = makeNumber(data.conversionCount);
  }

  if (data.googleAnalyticsRequiredDataList) {
    data.googleAnalyticsRequiredDataList.forEach((d) => {
      if (!isValidValue(d.value)) return;
      conversionEvent[d.name] = makeString(d.value);
    });
  }

  return conversionEvent;
}

function addUserData(data, eventData, conversionEvent) {
  const itemizeUserIdentifier = (input) => {
    const type = getType(input);
    if (type === 'array') return input.filter((e) => e);
    if (type === 'string' || type === 'number') return [input];
    return [];
  };
  const userDataIDsLengthLimit = 10;

  let emailAddresses;
  let phoneNumbers;
  let address;

  if (isUIFieldTrue(data.autoMapUserData)) {
    emailAddresses = getEmailAddressesFromEventData(eventData);
    phoneNumbers = getPhoneNumbersFromEventData(eventData);
    address = getAddressFromEventData(eventData);
  }

  if (data.userDataEmailAddresses) emailAddresses = data.userDataEmailAddresses;
  if (data.userDataPhoneNumbers) phoneNumbers = data.userDataPhoneNumbers;
  if (data.addUserDataAddress) {
    const addressUIFields = [
      'userDataAddressGivenName',
      'userDataAddressFamilyName',
      'userDataAddressRegion',
      'userDataAddressPostalCode'
    ];
    const inputAllAddressFieldsAreValid = addressUIFields.every((p) => isValidValue(data[p]));

    if (inputAllAddressFieldsAreValid) {
      address = {
        givenName: makeString(data.userDataAddressGivenName),
        familyName: makeString(data.userDataAddressFamilyName),
        regionCode: makeString(data.userDataAddressRegion),
        postalCode: makeString(data.userDataAddressPostalCode)
      };
    }
  }

  if (emailAddresses || phoneNumbers || address) {
    const userIdentifiers = [];

    if (emailAddresses) {
      emailAddresses = itemizeUserIdentifier(emailAddresses);
      if (emailAddresses.length) {
        emailAddresses.forEach((email) => userIdentifiers.push({ emailAddress: email }));
      }
    }

    if (phoneNumbers) {
      phoneNumbers = itemizeUserIdentifier(phoneNumbers);
      if (phoneNumbers.length) {
        phoneNumbers.forEach((phone) => userIdentifiers.push({ phoneNumber: phone }));
      }
    }

    if (address) {
      userIdentifiers.push({
        address: address
      });
    }

    if (userIdentifiers.length > 0) {
      conversionEvent.userData = {
        userIdentifiers: userIdentifiers.slice(0, userDataIDsLengthLimit)
      };
    }
  }

  return conversionEvent;
}

function addAdIdentifiers(data, eventData, conversionEvent) {
  const adIdentifiers = {};

  if (isUIFieldTrue(data.autoMapAdIdentifiersClickIds)) {
    const clickIds = withPowerClickClickIds(getClickIds(eventData), eventData);
    if (clickIds.gclid) adIdentifiers.gclid = clickIds.gclid;
    if (clickIds.gbraid) adIdentifiers.gbraid = clickIds.gbraid;
    if (clickIds.wbraid) adIdentifiers.wbraid = clickIds.wbraid;
    if (clickIds.dclid) adIdentifiers.dclid = clickIds.dclid;
  }

  if (data.adIdentifiersGclid) adIdentifiers.gclid = data.adIdentifiersGclid;
  if (data.adIdentifiersGbraid) adIdentifiers.gbraid = data.adIdentifiersGbraid;
  if (data.adIdentifiersWbraid) adIdentifiers.wbraid = data.adIdentifiersWbraid;
  if (data.adIdentifiersDclid) adIdentifiers.dclid = data.adIdentifiersDclid;
  if (data.adIdentifiersMatchId) adIdentifiers.matchId = data.adIdentifiersMatchId;
  if (data.adIdentifiersImpressionId) adIdentifiers.impressionId = data.adIdentifiersImpressionId;
  if (getType(data.adIdentifiersEncryptedUserId) === 'array') {
    adIdentifiers.encryptedUserId = data.adIdentifiersEncryptedUserId;
  }
  if (data.adIdentifiersMobileDeviceId) {
    adIdentifiers.mobileDeviceId = data.adIdentifiersMobileDeviceId;
  }

  if (isUIFieldTrue(data.autoMapAdIdentifiersSessionAttributes)) {
    const commonCookie = eventData.common_cookie || {};
    const sessionAttributes =
      eventData.session_attributes ||
      commonCookie._dm_session_attributes ||
      getCookieValues('_dm_session_attributes')[0];
    if (sessionAttributes) adIdentifiers.sessionAttributes = sessionAttributes;
  }

  if (data.adIdentifiersLandingPageDeviceInfoUserAgent) {
    adIdentifiers.landingPageDeviceInfo = adIdentifiers.landingPageDeviceInfo || {};
    adIdentifiers.landingPageDeviceInfo.userAgent =
      data.adIdentifiersLandingPageDeviceInfoUserAgent;
  }
  if (data.adIdentifiersLandingPageDeviceInfoIpAddress) {
    adIdentifiers.landingPageDeviceInfo = adIdentifiers.landingPageDeviceInfo || {};
    adIdentifiers.landingPageDeviceInfo.ipAddress =
      data.adIdentifiersLandingPageDeviceInfoIpAddress;
  }

  if (data.adIdentifiersSessionAttributes) {
    adIdentifiers.sessionAttributes = data.adIdentifiersSessionAttributes;
  }

  if (hasProps(adIdentifiers)) conversionEvent.adIdentifiers = adIdentifiers;

  return conversionEvent;
}

function addEventDeviceInformation(data, eventData, conversionEvent) {
  const eventDeviceInfo = {};

  if (isUIFieldTrue(data.autoMapEventDeviceInfo)) {
    if (eventData.user_agent) eventDeviceInfo.userAgent = eventData.user_agent;
    if (eventData.ip_override) eventDeviceInfo.ipAddress = eventData.ip_override;
    if (eventData.screen_resolution && getType(eventData.screen_resolution) === 'string') {
      const width = makeInteger(eventData.screen_resolution.split('x')[0]);
      const height = makeInteger(eventData.screen_resolution.split('x')[1]);
      if (isValidValue(width) && isValidValue(height)) {
        eventDeviceInfo.screenWidth = width;
        eventDeviceInfo.screenHeight = height;
      }
    }
  }

  if (data.eventDeviceInfoUserAgent) eventDeviceInfo.userAgent = data.eventDeviceInfoUserAgent;
  if (data.eventDeviceInfoIpAddress) eventDeviceInfo.ipAddress = data.eventDeviceInfoIpAddress;

  if (data.eventDeviceInfoList) {
    data.eventDeviceInfoList.forEach((d) => {
      let value = d.value;
      if (d.name === 'screenHeight' || d.name === 'screenWidth') {
        value = isValidValue(d.value) ? makeInteger(d.value) : undefined;
      }
      eventDeviceInfo[d.name] = value;
    });
  }

  if (hasProps(eventDeviceInfo)) conversionEvent.eventDeviceInfo = eventDeviceInfo;

  return conversionEvent;
}

function addUserProperties(data, conversionEvent) {
  const userProperties = {};

  if (data.userPropertiesCustomerType) {
    userProperties.customerType = data.userPropertiesCustomerType;
  }

  if (data.userPropertiesCustomerValueBucket) {
    userProperties.customerValueBucket = data.userPropertiesCustomerValueBucket;
  }

  if (data.userPropertiesList) {
    const additionalUserProperties = [];

    data.userPropertiesList.forEach((d) => {
      if (!isValidValue(d.name) || !isValidValue(d.value)) return;
      additionalUserProperties.push({
        propertyName: makeString(d.name),
        value: makeString(d.value)
      });
    });

    if (additionalUserProperties.length > 0) {
      userProperties.additionalUserProperties = additionalUserProperties;
    }
  }

  if (hasProps(userProperties)) {
    conversionEvent.userProperties = userProperties;
  }

  return conversionEvent;
}

function getItems(eventData) {
  if (getType(eventData.items) === 'array' && eventData.items.length) {
    return eventData.items;
  } else if (
    getType(eventData.ecommerce) === 'object' &&
    getType(eventData.ecommerce.items) === 'array' &&
    eventData.ecommerce.items.length
  ) {
    return eventData.ecommerce.items;
  }

  return;
}

function addAdditionalItemFields(data, item, sourceItem, excludeKeys, allowCustomVariables) {
  if (!data.addAdditionalItemParameters) return;

  const additionalItemParameters =
    getType(item.additionalItemParameters) === 'array' ? item.additionalItemParameters : [];
  const customVariables =
    allowCustomVariables && getType(item.customVariables) === 'array' ? item.customVariables : [];

  Object.keys(sourceItem).forEach((key) => {
    if (excludeKeys.indexOf(key) !== -1 || !isValidValue(sourceItem[key])) return;
    const value = makeString(sourceItem[key]);
    additionalItemParameters.push({ parameterName: key, value: value });
    if (allowCustomVariables) customVariables.push({ variable: key, value: value });
  });

  if (additionalItemParameters.length > 0) item.additionalItemParameters = additionalItemParameters;
  if (allowCustomVariables && customVariables.length > 0) item.customVariables = customVariables;
}

function addCartData(data, eventData, conversionEvent, destinations) {
  const cartData = {};
  // Per https://developers.google.com/data-manager/api/devguides/events/send-events#google-ads-store-sales,
  // items[].customVariables is only documented for Google Ads Store Sales conversions.
  const isGoogleAdsStoreSales =
    conversionEvent.eventSource === 'IN_STORE' && hasDestination(destinations, 'GOOGLE_ADS');

  if (isUIFieldTrue(data.autoMapCartData)) {
    const items = getItems(eventData);

    if (getType(items) === 'array' && items.length > 0) {
      const itemIdKey = data.itemIdKey ? data.itemIdKey : 'item_id';
      const cartDataItems = items
        .filter((i) => i[itemIdKey])
        .map((i) => {
          const item = {};
          item.itemId = makeString(i[itemIdKey]);
          item.merchantProductId = item.itemId; // Some destinations require merchantProductId to be present in order to process the cart data.
          if (i.quantity) item.quantity = makeString(i.quantity);
          if (isValidValue(i.price)) item.unitPrice = makeNumber(i.price);
          addAdditionalItemFields(
            data,
            item,
            i,
            [itemIdKey, 'quantity', 'price'],
            isGoogleAdsStoreSales
          );
          return item;
        });

      if (cartDataItems.length > 0) cartData.items = cartDataItems;
    }
  }

  if (data.cartDataMerchantId) cartData.merchantId = makeString(data.cartDataMerchantId);

  if (data.cartDataMerchantFeedLabel) {
    cartData.merchantFeedLabel = makeString(data.cartDataMerchantFeedLabel);
  }

  if (data.cartDataMerchantFeedLanguageCode) {
    cartData.merchantFeedLanguageCode = makeString(data.cartDataMerchantFeedLanguageCode);
  }

  if (isValidValue(data.cartDataTransactionDiscount)) {
    cartData.transactionDiscount = makeNumber(data.cartDataTransactionDiscount);
  }

  if (data.cartDataCouponCodes) {
    const itemizeCouponCode = (input) => {
      const type = getType(input);
      if (type === 'array') return input.filter((e) => e);
      if (type === 'string' || type === 'number') return [input];
      return;
    };
    const couponCodes = itemizeCouponCode(data.cartDataCouponCodes);
    if (couponCodes && couponCodes.length) cartData.couponCodes = couponCodes;
  }

  if (getType(data.cartDataItems) === 'array' && data.cartDataItems.length > 0) {
    const cartDataItems = data.cartDataItems
      .filter((i) => i.itemId || i.merchantProductId)
      .map((i) => {
        const item = {};
        item.itemId = makeString(i.itemId || i.merchantProductId);
        item.merchantProductId = makeString(i.merchantProductId || i.itemId); // Some destinations require merchantProductId to be present in order to process the cart data.
        if (i.quantity) item.quantity = makeString(i.quantity);
        if (isValidValue(i.unitPrice)) item.unitPrice = makeNumber(i.unitPrice);
        if (i.merchantId) item.merchantId = makeString(i.merchantId);
        if (i.merchantFeedLabel) item.merchantFeedLabel = makeString(i.merchantFeedLabel);
        if (i.merchantFeedLanguageCode) {
          item.merchantFeedLanguageCode = makeString(i.merchantFeedLanguageCode);
        }
        if (isValidValue(i.conversionValue)) item.conversionValue = makeNumber(i.conversionValue);
        // Preserve additionalItemParameters/customVariables if the user already supplied them
        // directly as Item-schema-conformant arrays, per the field's documented behavior.
        if (getType(i.additionalItemParameters) === 'array') {
          item.additionalItemParameters = i.additionalItemParameters;
        }
        if (isGoogleAdsStoreSales && getType(i.customVariables) === 'array') {
          item.customVariables = i.customVariables;
        }
        addAdditionalItemFields(
          data,
          item,
          i,
          [
            'merchantProductId',
            'itemId',
            'quantity',
            'unitPrice',
            'merchantId',
            'merchantFeedLabel',
            'merchantFeedLanguageCode',
            'conversionValue',
            'additionalItemParameters',
            'customVariables'
          ],
          isGoogleAdsStoreSales
        );
        return item;
      });

    if (cartDataItems.length > 0) cartData.items = cartDataItems;
  }

  if (hasProps(cartData)) conversionEvent.cartData = cartData;

  return conversionEvent;
}

function addCustomVariables(data, conversionEvent) {
  const customVariables = [];

  if (data.customVariablesList) {
    data.customVariablesList.forEach((d) => {
      if (!isValidValue(d.name) || !isValidValue(d.value)) return;

      const customVariable = { variable: makeString(d.name), value: makeString(d.value) };

      if (d.destinationReferences) {
        const destinationReferences = (
          getType(d.destinationReferences) === 'array'
            ? d.destinationReferences
            : [d.destinationReferences]
        )
          .filter((dr) => isValidValue(dr))
          .map((dr) => makeString(dr));

        if (destinationReferences.length) {
          customVariable.destinationReferences = destinationReferences;
        }
      }

      customVariables.push(customVariable);
    });

    if (customVariables.length > 0) conversionEvent.customVariables = customVariables;
  }

  return conversionEvent;
}

function addEventLocation(data, conversionEvent) {
  const eventLocation = {};

  if (data.eventLocationList) {
    data.eventLocationList.forEach((d) => {
      eventLocation[d.name] = isValidValue(d.value) ? makeString(d.value) : undefined;
    });
  }

  if (hasProps(eventLocation)) conversionEvent.eventLocation = eventLocation;

  return conversionEvent;
}

function addAdditionalEventParameters(data, conversionEvent) {
  if (data.additionalEventParametersList) {
    const additionalEventParameters = [];

    data.additionalEventParametersList.forEach((d) => {
      if (!isValidValue(d.name) || !isValidValue(d.value)) return;
      additionalEventParameters.push({
        parameterName: makeString(d.name),
        value: makeString(d.value)
      });
    });

    if (additionalEventParameters.length > 0) {
      conversionEvent.additionalEventParameters = additionalEventParameters;
    }
  }

  return conversionEvent;
}

function addConversionEventsData(data, eventData, mappedData) {
  if (data.conversionEventMode === 'single') {
    const conversionEvent = {};

    addConversionInformation(data, eventData, conversionEvent);
    addUserData(data, eventData, conversionEvent);
    addAdIdentifiers(data, eventData, conversionEvent);
    addEventDeviceInformation(data, eventData, conversionEvent);
    addUserProperties(data, conversionEvent);
    addCartData(data, eventData, conversionEvent, mappedData.destinations);
    addCustomVariables(data, conversionEvent);
    addEventLocation(data, conversionEvent);
    addAdditionalEventParameters(data, conversionEvent);

    mappedData.events = [conversionEvent];
  } else if (
    data.conversionEventMode === 'multiple' &&
    getType(data.conversionEvents) === 'array' &&
    data.conversionEvents.length > 0
  ) {
    mappedData.events = data.conversionEvents;
  }

  return mappedData;
}

function addEncodingData(data, mappedData) {
  // Avoids overwriting the encoding information if the tag auto-hashed (HEX output) User Data.
  const encoding = mappedData.encoding || data.userDataEncoding;
  if (encoding) mappedData.encoding = encoding;

  return mappedData;
}

function addEncryptionData(data, mappedData) {
  const encryptionInfo = {
    gcpWrappedKeyInfo: {
      keyType: data.gcpWrappedKeyType,
      wipProvider: data.gcpWrappedKeyWipProvider,
      kekUri: data.gcpWrappedKeyKekUri,
      encryptedDek: data.gcpWrappedKeyEncryptedDek
    }
  };

  mappedData.encryptionInfo = encryptionInfo;

  return mappedData;
}

function normalizeEmailAddress(email) {
  if (!email) return email;

  const emailParts = email.split('@');
  if (emailParts[1] === 'gmail.com' || emailParts[1] === 'googlemail.com') {
    emailParts[0] = emailParts[0].split('.').join('').split('+')[0];
  }
  return emailParts.join('@');
}

function normalizePhoneNumber(phoneNumber) {
  if (!phoneNumber) return phoneNumber;

  phoneNumber = phoneNumber
    .split(' ')
    .join('')
    .split('-')
    .join('')
    .split('(')
    .join('')
    .split(')')
    .join('');
  if (phoneNumber[0] !== '+') phoneNumber = '+' + phoneNumber;
  return phoneNumber;
}

function hashDataIfNeeded(mappedData) {
  const conversionEvents = mappedData.events;

  if (getType(conversionEvents) !== 'array') return;

  conversionEvents.forEach((conversionEvent) => {
    if (
      getType(conversionEvent) !== 'object' ||
      getType(conversionEvent.userData) !== 'object' ||
      getType(conversionEvent.userData.userIdentifiers) !== 'array'
    ) {
      return;
    }

    conversionEvent.userData.userIdentifiers.forEach((userIdentifier) => {
      const key = Object.keys(userIdentifier)[0];

      if (key === 'emailAddress' || key === 'phoneNumber') {
        let value = userIdentifier[key];

        if (!value) return;

        if (isSHA256HexHashed(value)) {
          mappedData.encoding = 'HEX';
          return;
        } else if (isSHA256Base64Hashed(value)) {
          mappedData.encoding = 'BASE64';
          return;
        }

        if (key === 'phoneNumber') value = normalizePhoneNumber(value);
        else if (key === 'emailAddress') value = normalizeEmailAddress(value);

        userIdentifier[key] = hashData(value);
        mappedData.encoding = 'HEX';
      } else if (key === 'address') {
        if (getType(userIdentifier.address) !== 'object') return;

        const addressKeysToHash = ['givenName', 'familyName'];
        addressKeysToHash.forEach((nameKey) => {
          const value = userIdentifier.address[nameKey];
          if (!value) return;

          if (isSHA256HexHashed(value)) {
            mappedData.encoding = 'HEX';
            return;
          } else if (isSHA256Base64Hashed(value)) {
            mappedData.encoding = 'BASE64';
            return;
          }

          userIdentifier.address[nameKey] = hashData(value);
          mappedData.encoding = 'HEX';
        });
      }
    });
  });

  return mappedData;
}

function getClickIds(eventData) {
  const parseClickIdFromCookieValue = (cookieValue, cookieType) => {
    if (getType(cookieValue) !== 'string') return;
    if (cookieType === 'server') {
      const cookieValueMatch = cookieValue.match('\\.k(.+)\\$i');
      return cookieValueMatch ? cookieValueMatch[1] : undefined;
    } else if (cookieType === 'js') {
      const cookieValueSplit = cookieValue.split('.');
      return cookieValueSplit[cookieValueSplit.length - 1];
    }
  };
  const getClickIdValueFromSources = (clickIdName, eventData, urlSearchParams) => {
    const commonCookie = eventData.common_cookie || {};
    const clickIdNameMapping = {
      gclid: { server: 'FPGCLAW', js: '_gcl_aw' },
      gbraid: { server: 'FPGCLAG', js: '_gcl_ag' },
      wbraid: { server: 'FPGCLGB', js: '_gcl_gb' },
      dclid: { server: 'FPGCLDC', js: '_gcl_dc' }
    };
    const serverCookieName = clickIdNameMapping[clickIdName].server;
    const jsCookieName = clickIdNameMapping[clickIdName].js;
    return (
      eventData[clickIdName] ||
      urlSearchParams[clickIdName] ||
      parseClickIdFromCookieValue(
        eventData[serverCookieName] ||
          commonCookie[serverCookieName] ||
          getCookieValues(serverCookieName)[0],
        'server'
      ) ||
      parseClickIdFromCookieValue(
        eventData[jsCookieName] ||
          eventData[jsCookieName.substring(1)] ||
          commonCookie[jsCookieName] ||
          getCookieValues(jsCookieName)[0],
        clickIdName === 'gbraid' ? 'server' : 'js' // '_gcl_ag' follows the Server format
      )
    );
  };
  const urlSearchParams = (parseUrl(getUrl(eventData)) || {}).searchParams || {};

  return {
    gclid: getClickIdValueFromSources('gclid', eventData, urlSearchParams),
    gbraid: getClickIdValueFromSources('gbraid', eventData, urlSearchParams),
    wbraid: getClickIdValueFromSources('wbraid', eventData, urlSearchParams),
    dclid: getClickIdValueFromSources('dclid', eventData, urlSearchParams)
  };
}

// PowerClick: the click ID our landing script captured for this journey's click (sjo.campaign.click_ids, carried on
// every later event) comes FIRST; Google's own sources — the page URL, _gcl_aw, FPGCLAW — only when ours is absent.
// Google's sources are empty on checkout / order-received pages whenever its cookie is missing (novos order 301409,
// 2026-10-14, iPhone: the purchase went without a gclid), and its cookie can hold an OLDER click than the one this
// journey is attributed to (novos v1-g-15278287130-01-20261014T02-kueq6h: Begin Checkout sent a previous click's
// gclid). One identifier only — the one we attributed the journey to — so Google never gets two that disagree.
function withPowerClickClickIds(clickIds, eventData) {
  const campaign = (eventData.sjo && eventData.sjo.campaign) || {};
  const ours = campaign.click_ids || {};
  const keys = ['gclid', 'gbraid', 'wbraid'];
  for (let i = 0; i < keys.length; i++) {
    const value = ours[keys[i]];
    if (getType(value) === 'string' && value) {
      const only = {};
      only[keys[i]] = value;
      return only;
    }
  }
  return clickIds;
}

// PowerClick: where the click ID on this send came from, and which sources existed — presence only, never
// cookie values. Answers "why did this purchase go without a gclid?" from the delivery record itself.
function powerClickClickIdDiagnostics(adIds) {
  const google = getClickIds(eventData);
  const googleFound = !!(google.gclid || google.gbraid || google.wbraid || google.dclid);
  const sent = !!(adIds.gclid || adIds.gbraid || adIds.wbraid || adIds.dclid);
  const ours = ((eventData.sjo && eventData.sjo.campaign) || {}).click_ids || {};
  const oursFound = !!(ours.gclid || ours.gbraid || ours.wbraid);
  const url = getUrl(eventData) || '';
  const commonCookie = eventData.common_cookie || {};
  return {
    click_id_source: sent ? (oursFound ? 'powerclick' : 'google') : 'none',
    // Google's own sources held a different gclid than ours — a stale cookie from an earlier click.
    google_click_id_differs: !!(oursFound && googleFound && ours.gclid && google.gclid && ours.gclid !== google.gclid),
    url_has_click_id: url.indexOf('gclid=') !== -1 || url.indexOf('gbraid=') !== -1 || url.indexOf('wbraid=') !== -1,
    gcl_aw_cookie: !!(getCookieValues('_gcl_aw')[0] || eventData._gcl_aw || commonCookie._gcl_aw),
    fpgclaw_cookie: !!(getCookieValues('FPGCLAW')[0] || eventData.FPGCLAW || commonCookie.FPGCLAW),
    powerclick_click_id: oursFound
  };
}

function generateRequestUrl(data) {
  if (data.authFlow === 'own') {
    return 'https://datamanager.googleapis.com/v' + API_VERSION + '/events:ingest';
  }

  const containerIdentifier = getRequestHeader('x-gtm-identifier');
  const defaultDomain = getRequestHeader('x-gtm-default-domain');
  const containerApiKey = getRequestHeader('x-gtm-api-key');
  return (
    'https://' +
    enc(containerIdentifier) +
    '.' +
    enc(defaultDomain) +
    '/stape-api/' +
    enc(containerApiKey) +
    '/v2/data-manager/events/ingest'
  );
}

function generateRequestOptions(data) {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    }
  };

  if (data.authFlow === 'own') {
    const auth = getGoogleAuth({
      scopes: ['https://www.googleapis.com/auth/datamanager']
    });
    options.authorization = auth;
    if (data.xGoogUserProject) options.headers['x-goog-user-project'] = data.xGoogUserProject;
  } else if (data.authFlow === 'stape') {
    options.headers['x-datamanager-api-version'] = API_VERSION;
    options.timeout = 20000;
  }

  return options;
}

function getDataForConversionEventsUpload(data, eventData) {
  const mappedData = {
    validateOnly: isUIFieldTrue(data.validateOnly)
  };

  addDestinationsData(data, mappedData);
  addConsentData(data, mappedData);
  addConversionEventsData(data, eventData, mappedData);
  hashDataIfNeeded(mappedData); // This should come before addEncodingData().
  addEncodingData(data, mappedData);
  if (isUIFieldTrue(data.enableUserDataEncryption)) {
    addEncryptionData(data, mappedData);
  }

  return mappedData;
}

function sendRequest(data, mappedData) {
  const requestUrl = generateRequestUrl(data);
  const requestOptions = generateRequestOptions(data);
  const requestBody = mappedData;

  return sendHttpRequest(requestUrl, requestOptions, JSON.stringify(requestBody))
    .then((result) => {
      // .then has to be used when the Authorization header is in use
      logToPowerClick(data, mappedData, result);

      if (!useOptimisticScenario) {
        if (result.statusCode >= 200 && result.statusCode < 400) return data.gtmOnSuccess();
        return data.gtmOnFailure();
      }
    })
    .catch((result) => {
      // Still log to PowerClick on failure so /capi shows the failed attempt.
      // Synthesise a result-shaped object so the downstream logger doesn't
      // have to special-case timeouts vs. real HTTP responses.
      logToPowerClick(data, mappedData, { statusCode: 0, body: typeof result === 'string' ? result : JSON.stringify(result) });

      if (!useOptimisticScenario) return data.gtmOnFailure();
    });
}

/**
 * PowerClick CAPI response logger — mirrors capi-logger-meta.js so /capi
 * shows Google conversion deliveries the same way it shows Meta. Fire-and-
 * forget: any failure here is silent so it never blocks the Google call's
 * success/failure path. Only runs when the PowerClick Tenant ID field is set.
 */
function logToPowerClick(data, mappedData, result) {
  if (!data.clicksporeTenantId) return;
  const events = (mappedData && mappedData.events) || [];
  // One Stape tag fire = one conversion event in 99% of cases; if multiple
  // events are bundled, post one PowerClick record per event so /capi treats
  // them as distinct deliveries.
  for (let i = 0; i < events.length; i++) {
    const ev = events[i] || {};
    const adIds = ev.adIdentifiers || {};
    const userData = ev.userData || {};
    const eventDeviceInfo = ev.eventDeviceInfo || {};
    const eventMetadata = ev.eventMetadata || {};

    const mappedName = ev.name || 'unknown';
    const sourceName = eventData.event_name || mappedName;

    sendHttpRequest(
      POWERCLICK_INGEST + '?tenant_id=' + data.clicksporeTenantId,
      { headers: { 'content-type': 'application/json' }, method: 'POST' },
      JSON.stringify({
        type: 'capi_response',
        ts_ms: getTimestampMillis(),
        event_source: 'sgtm',
        platform: 'google',
        destinations: mappedData.destinations || [],
        source_event: sourceName,
        event_name: data.customEventName || mappedName,
        event_id: ev.transactionId || eventData.transaction_id || eventData.event_id,
        // PowerClick attribution match key. The event's own sources win; data.sporeId is the LAST
        // fallback, so it only fills the blank on cross-domain checkout-sandbox events where the
        // __spore_id cookie + storefront dataLayer are gone. Storefront hits (incl. lp_view, where
        // the id is minted and the store isn't written yet) carry spore_id in event data and need NO
        // field — map data.sporeId ONLY on the cross-domain tags. It's a match key (resolves a journey
        // or not), not an unverifiable claim, so recovering it from the store is honest.
        spore_id: eventData.spore_id || (eventData.sjo && eventData.sjo.spore_id) || eventData['x-sp-spore_id'] || getCookieValues('__spore_id')[0] || data.sporeId || '',
        // Google's equivalent of fbc — first non-empty of gclid / gbraid / wbraid / dclid. These are
        // the click IDs ACTUALLY SENT to Google on this request (from adIdentifiers), so click_id is a
        // truthful record of the send, not an unverifiable store guess.
        click_id: adIds.gclid || adIds.gbraid || adIds.wbraid || adIds.dclid || '',
        g_response: {
          status_code: result.statusCode,
          body: result.body,
          // requestId is Google's Ads-diagnostics cross-reference. It's present ONLY via authFlow 'own'
          // (Google returns it in the JSON body). Via the Stape proxy Google's response is collapsed to
          // a plaintext "Accepted" and requestId is stripped — so this stays empty on that path, and the
          // only correlation id available is Stape's own trace-id (captured below, for Stape-log lookups,
          // NOT usable in Google Ads diagnostics). The extractor also checks headers so it lights up
          // automatically if this tag is ever switched to authFlow 'own'.
          request_id: extractGoogleRequestId(result),
          trace_id: (result.headers || {})['trace-id'],
          // Set when the template's own validation stopped the send: Google never received this event.
          not_sent_reason: result.notSentReason || undefined
        },
        diagnostics: powerClickClickIdDiagnostics(adIds),
        user_data: userData,
        custom_data: {
          conversion_value: ev.conversionValue,
          currency_code: ev.currencyCode,
          transaction_id: ev.transactionId,
          items: ev.cartData && ev.cartData.items,
          event_metadata: eventMetadata
        },
        ad_identifiers: adIds,
        action_source: 'web',
        context: {
          page_location: eventData.page_location,
          user_agent: eventData.user_agent || eventDeviceInfo.userAgent,
          ip_address: eventDeviceInfo.ipAddress,
          gclid: adIds.gclid,
          gbraid: adIds.gbraid,
          wbraid: adIds.wbraid,
          dclid: adIds.dclid
        }
      })
    );
  }
}

function extractGoogleRequestId(result) {
  if (!result) return undefined;

  // 1) Response headers — how the request id comes back on a Stape-proxied 202 (the body is just the
  //    string "Accepted", no JSON). sGTM lowercases response-header keys. Names vary, so check the
  //    known candidates; the first match wins.
  const headers = result.headers || {};
  const headerCandidates = ['x-goog-request-id', 'x-request-id', 'request-id', 'x-guploader-uploadid'];
  for (let i = 0; i < headerCandidates.length; i++) {
    const h = headers[headerCandidates[i]];
    if (h) return getType(h) === 'array' ? h[0] : h;
  }

  // 2) Response body — when calling Google directly (authFlow 'own') the body IS JSON: {"requestId":…}.
  //    Through the Stape proxy the body is the plaintext string "Accepted".
  //    Sandboxed JSON.parse THROWS on invalid JSON (`Unexpected token 'A', "Accepted" is not valid
  //    JSON`) — it does NOT return undefined. There is no try/catch in sandboxed sGTM either, so the
  //    only safe move is to look before parsing: a body that doesn't start with { or [ is not JSON.
  const body = result.body;
  if (getType(body) === 'string') {
    const trimmed = body.trim();
    if (trimmed.indexOf('{') === 0 || trimmed.indexOf('[') === 0) {
      const parsed = JSON.parse(trimmed);
      if (parsed && parsed.requestId) return parsed.requestId;
    }
  }

  return undefined;
}

function validateMappedData(mappedData) {
  const conversionEvents = mappedData.events;

  if (getType(conversionEvents) !== 'array' || conversionEvents.length === 0) {
    return 'At least 1 Conversion Event must be specified.';
  }

  const destinations = mappedData.destinations;
  const hasGoogleAnalytics = hasDestination(destinations, 'GOOGLE_ANALYTICS_PROPERTY');
  const hasGoogleAds = hasDestination(destinations, 'GOOGLE_ADS');
  const hasFloodlight = hasDestination(destinations, 'FLOODLIGHT_CONFIG');

  if (hasGoogleAnalytics) {
    const isGA4DataInvalid = conversionEvents.some((event) => {
      if (!event.eventName) return true;
      return (
        !(event.eventSource === 'WEB' && event.clientId) &&
        !(event.eventSource === 'APP' && event.appInstanceId)
      );
    });
    if (isGA4DataInvalid) {
      return 'When Google Analytics Property is a destination, "eventName" is required, and at least "clientId" (Web Stream) or "appInstanceId" (App Stream) must be specified.';
    }
  }

  const isUserDataAbsent = (event) => {
    return (
      getType(event.userData) !== 'object' ||
      getType(event.userData.userIdentifiers) !== 'array' ||
      event.userData.userIdentifiers.length === 0 ||
      event.userData.userIdentifiers.some((i) => {
        const userIdentifierIsObject = getType(i) === 'object';
        const userIdentifierKey = userIdentifierIsObject ? Object.keys(i)[0] : undefined;
        const userIdentifierValue = userIdentifierIsObject ? Object.values(i)[0] : undefined;
        return (
          !hasProps(i) ||
          !userIdentifierValue ||
          (userIdentifierKey === 'address' &&
            (!hasProps(userIdentifierValue) || Object.values(userIdentifierValue).some((v) => !v)))
        );
      })
    );
  };
  const isAdIdentifiersAbsent = (event) => {
    const adIdentifierEntries =
      getType(event.adIdentifiers) === 'object' ? Object.entries(event.adIdentifiers) : undefined;
    return (
      getType(event.adIdentifiers) !== 'object' ||
      !hasProps(event.adIdentifiers) ||
      adIdentifierEntries.every((keyValue) => {
        const key = keyValue[0];
        const value = keyValue[1];
        return (
          !value ||
          (key === 'landingPageDeviceInfo' &&
            (!hasProps(value) || Object.values(value).every((v) => !v)))
        );
      })
    );
  };

  if (hasGoogleAds || hasFloodlight) {
    // Per https://developers.google.com/data-manager/api/devguides/events/send-events#google-ads,
    // eventDeviceInfo.ipAddress is a valid standalone identifier for Google Ads (except IN_STORE).
    const doesNotHaveMatchData = conversionEvents.some((event) => {
      const hasIpAddressIdentifier =
        hasGoogleAds &&
        event.eventSource !== 'IN_STORE' &&
        event.eventDeviceInfo &&
        event.eventDeviceInfo.ipAddress;
      return isUserDataAbsent(event) && isAdIdentifiersAbsent(event) && !hasIpAddressIdentifier;
    });
    if (doesNotHaveMatchData) {
      return 'At least 1 Ad Identifier or User Data must be specified.';
    }
  }

  if (hasGoogleAds) {
    const isInStoreDataMissing = conversionEvents.some((event) => {
      if (event.eventSource !== 'IN_STORE') return false;
      return (
        !(event.eventLocation && event.eventLocation.storeId) ||
        !event.currency ||
        !isValidValue(event.conversionValue)
      );
    });
    if (isInStoreDataMissing) {
      return 'eventLocation.storeId, currency and conversionValue are required for "IN_STORE" events.';
    }
  }

  const rfc3339Regex = '^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.+';
  const isTimestampFormatInvalid = conversionEvents.some((event) => {
    return ['eventTimestamp', 'lastUpdatedTimestamp'].some((key) => {
      return event[key] && (getType(event[key]) !== 'string' || !event[key].match(rfc3339Regex));
    });
  });
  if (isTimestampFormatInvalid) {
    return 'Timestamp format is invalid.';
  }

  const isTransactionIdInvalid = conversionEvents.some((event) => {
    return (
      event.transactionId &&
      (event.transactionId.length === 1 ||
        ['123', '1234', 'null', 'undefined', 'none', 'transactionId', 'transaction_id'].indexOf(
          event.transactionId
        ) !== -1)
    );
  });
  if (isTransactionIdInvalid) {
    return 'Transaction ID value is invalid.';
  }

  const isMerchantProductIdAbsent = conversionEvents.some((event) => {
    return (
      getType(event.cartData) === 'object' &&
      getType(event.cartData.items) === 'array' &&
      event.cartData.items.some((item) => getType(item) === 'object' && !item.merchantProductId)
    );
  });
  if (isMerchantProductIdAbsent) {
    return 'Each item in cartData.items must have a merchantProductId.';
  }

  const destinationsLengthLimit = 10;
  if (destinations.length > destinationsLengthLimit) {
    return 'Destinations list length must be at most ' + destinationsLengthLimit + '.';
  }

  const validationKeys = [
    'productDestinationId',
    'reference',
    'operatingAccount.accountId',
    'linkedAccount.accountId',
    'loginAccount.accountId'
  ];
  for (let i = 0; i < destinations.length; i++) {
    const destination = destinations[i];
    for (let j = 0; j < validationKeys.length; j++) {
      const key = validationKeys[j];
      const parts = key.split('.');
      if (parts.length > 1 && !destination[parts[0]]) continue;
      const value = parts.reduce((acc, part) => acc && acc[part], destination);
      if (!isValidValue(value) || ['undefined', 'null'].indexOf(value) !== -1) {
        return 'destinations[' + i + '].' + key + ' is invalid.';
      }
    }
  }
}

function handleConversionEvent(data, eventData) {
  const mappedData = getDataForConversionEventsUpload(data, eventData);

  const invalidOrMissingFields = validateMappedData(mappedData);
  if (invalidOrMissingFields) {
    log({
      Name: 'GoogleConversionEvent',
      Type: 'Message',
      EventName: 'ConversionEvent',
      Message: '🛑 [ERROR] Request was not sent.',
      Reason: invalidOrMissingFields
    });
    logToPowerClick(data, mappedData, { statusCode: 0, body: 'not_sent', notSentReason: invalidOrMissingFields });

    data.gtmOnFailure();
    return true;
  }

  sendRequest(data, mappedData);
}

/*==============================================================================
  Helpers
==============================================================================*/

function shouldExitEarly(data, eventData) {
  if (!isConsentGivenOrNotRequired(data, eventData)) return true;

  const url = getUrl(eventData);
  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) return true;

  return false;
}

function getUrl(eventData) {
  return eventData.page_location || eventData.page_referrer || getRequestHeader('referer');
}

function getCookieDomain(data) {
  return !data.cookieDomain || data.cookieDomain === 'auto'
    ? computeEffectiveTldPlusOne(getEventData('page_location') || getRequestHeader('referer')) ||
        'auto'
    : data.cookieDomain;
}

function enc(data) {
  if (['null', 'undefined'].indexOf(getType(data)) !== -1) data = '';
  return encodeUriComponent(makeString(data));
}

function hasProps(obj) {
  return getType(obj) === 'object' && Object.keys(obj).length > 0;
}

function hasDestination(destinations, productType) {
  return (
    getType(destinations) === 'array' &&
    destinations.some((d) => d.operatingAccount && d.operatingAccount.accountType === productType)
  );
}

function isSHA256Base64Hashed(value) {
  if (!value) return false;
  const valueStr = makeString(value);
  const base64Regex = '^[A-Za-z0-9+/]{43}=?$';
  return valueStr.match(base64Regex) !== null;
}

function isSHA256HexHashed(value) {
  if (!value) return false;
  const valueStr = makeString(value);
  const hexRegex = '^[A-Fa-f0-9]{64}$';
  return valueStr.match(hexRegex) !== null;
}

function hashData(value) {
  if (!value) return value;

  const type = getType(value);

  if (value === 'undefined' || value === 'null') return undefined;

  if (type === 'array') {
    return value.map((val) => hashData(val));
  }

  if (type === 'object') {
    return Object.keys(value).reduce((acc, val) => {
      acc[val] = hashData(value[val]);
      return acc;
    }, {});
  }

  if (isSHA256HexHashed(value) || isSHA256Base64Hashed(value)) return value;

  return sha256Sync(makeString(value).trim().toLowerCase(), {
    outputEncoding: 'hex'
  });
}

function getConversionDateTime(timestamp) {
  if (!timestamp) return convertTimestampToRFC(getTimestampMillis());

  let timestampInt = makeInteger(timestamp);
  if (getType(timestampInt) === 'number' && timestampInt > 0) {
    const timestampString = makeString(timestamp);
    // This will be false only in 2286, when timestamps in seconds starts to have 11 digits.
    timestampInt = timestampString.length === 10 ? timestamp * 1000 : timestamp;
    return convertTimestampToRFC(timestampInt);
  }

  return timestamp;
}

function convertTimestampToRFC(timestamp) {
  const secToMs = function (s) {
    return s * 1000;
  };
  const minToMs = function (m) {
    return m * secToMs(60);
  };
  const hoursToMs = function (h) {
    return h * minToMs(60);
  };
  const daysToMs = function (d) {
    return d * hoursToMs(24);
  };
  const format = function (value) {
    return value >= 10 ? value.toString() : '0' + value;
  };
  const fourYearsInMs = daysToMs(365 * 4 + 1);
  let year = 1970 + Math.floor(timestamp / fourYearsInMs) * 4;
  timestamp = timestamp % fourYearsInMs;

  while (true) {
    const isLeapYear = !(year % 4);
    const nextTimestamp = timestamp - daysToMs(isLeapYear ? 366 : 365);
    if (nextTimestamp < 0) {
      break;
    }
    timestamp = nextTimestamp;
    year = year + 1;
  }

  const daysByMonth =
    year % 4 === 0
      ? [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      : [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  let month = 0;
  for (let i = 0; i < daysByMonth.length; i++) {
    const msInThisMonth = daysToMs(daysByMonth[i]);
    if (timestamp > msInThisMonth) {
      timestamp = timestamp - msInThisMonth;
    } else {
      month = i + 1;
      break;
    }
  }
  const date = Math.ceil(timestamp / daysToMs(1));
  timestamp = timestamp - daysToMs(date - 1);
  const hours = Math.floor(timestamp / hoursToMs(1));
  timestamp = timestamp - hoursToMs(hours);
  const minutes = Math.floor(timestamp / minToMs(1));
  timestamp = timestamp - minToMs(minutes);
  const sec = Math.floor(timestamp / secToMs(1));

  return (
    year +
    '-' +
    format(month) +
    '-' +
    format(date) +
    'T' +
    format(hours) +
    ':' +
    format(minutes) +
    ':' +
    format(sec) +
    '+00:00'
  );
}

function isValidValue(value) {
  const valueType = getType(value);
  return valueType !== 'null' && valueType !== 'undefined' && value !== '' && value === value;
}

function replaceAll(str, find, replace) {
  if (getType(str) !== 'string') return str;
  const regex = createRegex(find, 'g');
  return str.replace(regex, replace);
}

function isUIFieldTrue(field) {
  return [true, 'true'].indexOf(field) !== -1;
}

function isConsentGivenOrNotRequired(data, eventData) {
  if (data.adStorageConsent !== 'required') return true;
  if (eventData.consent_state) return !!eventData.consent_state.ad_storage;
  const xGaGcs = eventData['x-ga-gcs'] || ''; // x-ga-gcs is a string like "G110"
  return xGaGcs[2] === '1';
}

function log(rawDataToLog) {
  rawDataToLog.TraceId = getRequestHeader('trace-id');
  logToConsole(JSON.stringify(rawDataToLog));
}

/*
 * =============================================================================
 * POWERCLICK INTEGRATION — ADDITIONAL TEMPLATE FIELDS
 * =============================================================================
 *
 * This is Stape's "Google Data Manager API Conversion Events" template with a
 * PowerClick logger welded in: after the conversion is uploaded to Google's
 * Data Manager API, the REAL response is POSTed to PowerClick so /capi shows
 * Google conversions alongside Meta / TikTok / Microsoft / etc. No separate
 * logger tag is required — one tag handles both Google and PowerClick, and the
 * click_id it logs is exactly what it sent to Google (not a store guess).
 *
 * Fields (added by the PowerClick .tpl build — nothing to configure by hand):
 *
 * FIELD 1: clicksporeTenantId (text)
 *   - Type: Text input
 *   - Display name: "PowerClick Tenant ID"
 *   - Help text: "Your PowerClick tenant identifier (leave blank to disable
 *                 PowerClick logging on this tag instance)."
 *
 * FIELD 2: customEventName (text)
 *   - Type: Text input
 *   - Display name: "PowerClick Event Name"
 *   - Help text: "Override event name in PowerClick /capi dashboard
 *                 (e.g., 'Purchase', 'Lead'). If blank, uses the Google
 *                 conversion event name from the events array."
 *
 * FIELD 3: sporeId (text) — cross-domain FALLBACK, map ONLY on checkout/purchase tags
 *   - Type: Text input
 *   - Display name: "PowerClick Spore ID (store lookup)"
 *   - Map to a durable store-backed variable, e.g. {{sjo.spore_id(coalesce)}}
 *   - Help text: "Fallback (tried LAST): fills spore_id only on bottom-of-funnel events
 *                 (checkout/purchase) that fire in the Shopify web-pixel sandbox, where the
 *                 __spore_id cookie + storefront dataLayer are gone. Storefront tags carry
 *                 spore_id in event data already — leave empty there. Map ONLY on cross-domain tags."
 *
 * DATA SENT TO POWERCLICK (per event in the batch):
 *   - type:           'capi_response'
 *   - platform:       'google'
 *   - source_event:   eventData.event_name (the trigger event name)
 *   - event_name:     customEventName || mapped Google event name
 *   - event_id:       transactionId (Google's dedup identifier)
 *   - spore_id:       event data / sjo / cookie, then the sporeId store field (cross-domain only)
 *   - click_id:       gclid || gbraid || wbraid || dclid — the click IDs ACTUALLY SENT to Google on
 *                     this request (from mappedData.events[i].adIdentifiers), so it's a truthful
 *                     record of the send, not an unverifiable store guess. No store-backfill needed.
 *   - g_response:     { status_code, body, request_id, trace_id }
 *                     request_id = Google's Data Manager requestId (Ads-diagnostics cross-ref).
 *                       Populated ONLY on authFlow 'own' (direct to Google, returned in the JSON body).
 *                       Via the Stape proxy Google's response is collapsed to plaintext "Accepted" and
 *                       the requestId is stripped — so it stays empty on that path.
 *                     trace_id = Stape's own trace-id header (for Stape request-log lookups; NOT a
 *                       Google identifier and not usable in Google Ads diagnostics).
 *   - user_data:      The userIdentifiers block sent to Google (hashed).
 *   - custom_data:    conversion_value, currency_code, transaction_id, items, event_metadata.
 *   - ad_identifiers: Full adIdentifiers block sent to Google.
 *   - context:        page_location, user_agent, ip_address, gclid/gbraid/wbraid/dclid.
 *
 * RESPONSE RICHNESS NOTE:
 *   Data Manager gives per-request status, not per-event `events_received` like Meta. On authFlow
 *   'own' the JSON body also carries a `requestId`; on authFlow 'stape' the proxy returns plaintext
 *   "Accepted" (200-series) with no requestId. Either way /capi shows delivery rate (% of requests
 *   with statusCode 200-399) and surfaces validation errors from the body when present.
 *
 * ENDPOINT: https://ingest.powerclick.io/api/ingest?tenant_id={tenantId}
 * VIEW CAPI DATA: https://dashboard.powerclick.io/{tenant}/capi
 * =============================================================================
 */


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "trace-id"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "referer"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "x-gtm-identifier"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "x-gtm-default-domain"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "x-gtm-api-key"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://datamanager.googleapis.com/*"
              },
              {
                "type": 1,
                "string": "https://*.stape.io/*"
              },
              {
                "type": 1,
                "string": "https://*.stape.net/*"
              },
              {
                "type": 1,
                "string": "https://ingest.powerclick.io/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "use_google_credentials",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedScopes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.googleapis.com/auth/datamanager"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "FPGCLAW"
              },
              {
                "type": 1,
                "string": "_gcl_aw"
              },
              {
                "type": 1,
                "string": "FPGCLAG"
              },
              {
                "type": 1,
                "string": "_gcl_ag"
              },
              {
                "type": 1,
                "string": "FPGCLGB"
              },
              {
                "type": 1,
                "string": "_gcl_gb"
              },
              {
                "type": 1,
                "string": "FPGCLDC"
              },
              {
                "type": 1,
                "string": "_gcl_dc"
              },
              {
                "type": 1,
                "string": "_dm_session_attributes"
              },
              {
                "type": 1,
                "string": "__spore_id"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "set_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedCookies",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_dm_session_attributes"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

PowerClick build of stape-io/google-conversion-events-tag@ee54d37 (2026-07-23) + PowerClick CAPI logging. Source: gtm-scripts/capi/google-data-manager/ — do not edit in GTM; edit code.js and rebuild.


