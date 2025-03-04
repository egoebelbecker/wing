# [on_message.test.w](../../../../../../examples/tests/sdk_tests/topic/on_message.test.w) | compile | tf-aws

## main.tf.json
```json
{
  "//": {
    "metadata": {
      "backend": "local",
      "stackName": "root",
      "version": "0.17.0"
    },
    "outputs": {
      "root": {
        "Default": {
          "cloud.TestRunner": {
            "TestFunctionArns": "WING_TEST_RUNNER_FUNCTION_IDENTIFIERS"
          }
        }
      }
    }
  },
  "output": {
    "WING_TEST_RUNNER_FUNCTION_IDENTIFIERS": {
      "value": "[]"
    }
  },
  "provider": {
    "aws": [
      {}
    ]
  },
  "resource": {
    "aws_cloudwatch_log_group": {
      "cloudTopic-OnMessage-86898773_CloudwatchLogGroup_7B70C487": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-86898773/CloudwatchLogGroup",
            "uniqueId": "cloudTopic-OnMessage-86898773_CloudwatchLogGroup_7B70C487"
          }
        },
        "name": "/aws/lambda/cloud-Topic-OnMessage-86898773-c82dc92d",
        "retention_in_days": 30
      },
      "cloudTopic-OnMessage-cdafee6e_CloudwatchLogGroup_DF1BF72A": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-cdafee6e/CloudwatchLogGroup",
            "uniqueId": "cloudTopic-OnMessage-cdafee6e_CloudwatchLogGroup_DF1BF72A"
          }
        },
        "name": "/aws/lambda/cloud-Topic-OnMessage-cdafee6e-c814de3f",
        "retention_in_days": 30
      }
    },
    "aws_dynamodb_table": {
      "cloudCounter": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Counter/Default",
            "uniqueId": "cloudCounter"
          }
        },
        "attribute": [
          {
            "name": "id",
            "type": "S"
          }
        ],
        "billing_mode": "PAY_PER_REQUEST",
        "hash_key": "id",
        "name": "wing-counter-cloud.Counter-c866f225"
      }
    },
    "aws_iam_role": {
      "cloudTopic-OnMessage-86898773_IamRole_DFD96A7E": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-86898773/IamRole",
            "uniqueId": "cloudTopic-OnMessage-86898773_IamRole_DFD96A7E"
          }
        },
        "assume_role_policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Effect\":\"Allow\"}]}"
      },
      "cloudTopic-OnMessage-cdafee6e_IamRole_54B0303A": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-cdafee6e/IamRole",
            "uniqueId": "cloudTopic-OnMessage-cdafee6e_IamRole_54B0303A"
          }
        },
        "assume_role_policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Effect\":\"Allow\"}]}"
      }
    },
    "aws_iam_role_policy": {
      "cloudTopic-OnMessage-86898773_IamRolePolicy_28DDDC8E": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-86898773/IamRolePolicy",
            "uniqueId": "cloudTopic-OnMessage-86898773_IamRolePolicy_28DDDC8E"
          }
        },
        "policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"dynamodb:UpdateItem\"],\"Resource\":[\"${aws_dynamodb_table.cloudCounter.arn}\"],\"Effect\":\"Allow\"}]}",
        "role": "${aws_iam_role.cloudTopic-OnMessage-86898773_IamRole_DFD96A7E.name}"
      },
      "cloudTopic-OnMessage-cdafee6e_IamRolePolicy_986CF80A": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-cdafee6e/IamRolePolicy",
            "uniqueId": "cloudTopic-OnMessage-cdafee6e_IamRolePolicy_986CF80A"
          }
        },
        "policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"dynamodb:UpdateItem\"],\"Resource\":[\"${aws_dynamodb_table.cloudCounter.arn}\"],\"Effect\":\"Allow\"}]}",
        "role": "${aws_iam_role.cloudTopic-OnMessage-cdafee6e_IamRole_54B0303A.name}"
      }
    },
    "aws_iam_role_policy_attachment": {
      "cloudTopic-OnMessage-86898773_IamRolePolicyAttachment_72F8DDD8": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-86898773/IamRolePolicyAttachment",
            "uniqueId": "cloudTopic-OnMessage-86898773_IamRolePolicyAttachment_72F8DDD8"
          }
        },
        "policy_arn": "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
        "role": "${aws_iam_role.cloudTopic-OnMessage-86898773_IamRole_DFD96A7E.name}"
      },
      "cloudTopic-OnMessage-cdafee6e_IamRolePolicyAttachment_32D59DC5": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-cdafee6e/IamRolePolicyAttachment",
            "uniqueId": "cloudTopic-OnMessage-cdafee6e_IamRolePolicyAttachment_32D59DC5"
          }
        },
        "policy_arn": "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
        "role": "${aws_iam_role.cloudTopic-OnMessage-cdafee6e_IamRole_54B0303A.name}"
      }
    },
    "aws_lambda_function": {
      "cloudTopic-OnMessage-86898773": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-86898773/Default",
            "uniqueId": "cloudTopic-OnMessage-86898773"
          }
        },
        "architectures": [
          "arm64"
        ],
        "environment": {
          "variables": {
            "DYNAMODB_TABLE_NAME_49baa65c": "${aws_dynamodb_table.cloudCounter.name}",
            "NODE_OPTIONS": "--enable-source-maps",
            "WING_FUNCTION_NAME": "cloud-Topic-OnMessage-86898773-c82dc92d",
            "WING_TARGET": "tf-aws"
          }
        },
        "function_name": "cloud-Topic-OnMessage-86898773-c82dc92d",
        "handler": "index.handler",
        "memory_size": 1024,
        "publish": true,
        "role": "${aws_iam_role.cloudTopic-OnMessage-86898773_IamRole_DFD96A7E.arn}",
        "runtime": "nodejs18.x",
        "s3_bucket": "${aws_s3_bucket.Code.bucket}",
        "s3_key": "${aws_s3_object.cloudTopic-OnMessage-86898773_S3Object_7D6100A3.key}",
        "timeout": 60,
        "vpc_config": {
          "security_group_ids": [],
          "subnet_ids": []
        }
      },
      "cloudTopic-OnMessage-cdafee6e": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-cdafee6e/Default",
            "uniqueId": "cloudTopic-OnMessage-cdafee6e"
          }
        },
        "architectures": [
          "arm64"
        ],
        "environment": {
          "variables": {
            "DYNAMODB_TABLE_NAME_49baa65c": "${aws_dynamodb_table.cloudCounter.name}",
            "NODE_OPTIONS": "--enable-source-maps",
            "WING_FUNCTION_NAME": "cloud-Topic-OnMessage-cdafee6e-c814de3f",
            "WING_TARGET": "tf-aws"
          }
        },
        "function_name": "cloud-Topic-OnMessage-cdafee6e-c814de3f",
        "handler": "index.handler",
        "memory_size": 1024,
        "publish": true,
        "role": "${aws_iam_role.cloudTopic-OnMessage-cdafee6e_IamRole_54B0303A.arn}",
        "runtime": "nodejs18.x",
        "s3_bucket": "${aws_s3_bucket.Code.bucket}",
        "s3_key": "${aws_s3_object.cloudTopic-OnMessage-cdafee6e_S3Object_59ED9245.key}",
        "timeout": 60,
        "vpc_config": {
          "security_group_ids": [],
          "subnet_ids": []
        }
      }
    },
    "aws_lambda_permission": {
      "cloudTopic-OnMessage-86898773_InvokePermission-c82b57aa3e58b626b884e8374e59ec192cf61df91b_8E6FF007": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-86898773/InvokePermission-c82b57aa3e58b626b884e8374e59ec192cf61df91b",
            "uniqueId": "cloudTopic-OnMessage-86898773_InvokePermission-c82b57aa3e58b626b884e8374e59ec192cf61df91b_8E6FF007"
          }
        },
        "action": "lambda:InvokeFunction",
        "function_name": "${aws_lambda_function.cloudTopic-OnMessage-86898773.function_name}",
        "principal": "sns.amazonaws.com",
        "source_arn": "${aws_sns_topic.cloudTopic.arn}"
      },
      "cloudTopic-OnMessage-cdafee6e_InvokePermission-c82b57aa3e58b626b884e8374e59ec192cf61df91b_D167648C": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-cdafee6e/InvokePermission-c82b57aa3e58b626b884e8374e59ec192cf61df91b",
            "uniqueId": "cloudTopic-OnMessage-cdafee6e_InvokePermission-c82b57aa3e58b626b884e8374e59ec192cf61df91b_D167648C"
          }
        },
        "action": "lambda:InvokeFunction",
        "function_name": "${aws_lambda_function.cloudTopic-OnMessage-cdafee6e.function_name}",
        "principal": "sns.amazonaws.com",
        "source_arn": "${aws_sns_topic.cloudTopic.arn}"
      }
    },
    "aws_s3_bucket": {
      "Code": {
        "//": {
          "metadata": {
            "path": "root/Default/Code",
            "uniqueId": "Code"
          }
        },
        "bucket_prefix": "code-c84a50b1-"
      }
    },
    "aws_s3_object": {
      "cloudTopic-OnMessage-86898773_S3Object_7D6100A3": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-86898773/S3Object",
            "uniqueId": "cloudTopic-OnMessage-86898773_S3Object_7D6100A3"
          }
        },
        "bucket": "${aws_s3_bucket.Code.bucket}",
        "key": "<ASSET_KEY>",
        "source": "<ASSET_SOURCE>"
      },
      "cloudTopic-OnMessage-cdafee6e_S3Object_59ED9245": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic-OnMessage-cdafee6e/S3Object",
            "uniqueId": "cloudTopic-OnMessage-cdafee6e_S3Object_59ED9245"
          }
        },
        "bucket": "${aws_s3_bucket.Code.bucket}",
        "key": "<ASSET_KEY>",
        "source": "<ASSET_SOURCE>"
      }
    },
    "aws_sns_topic": {
      "cloudTopic": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic/Default",
            "uniqueId": "cloudTopic"
          }
        },
        "name": "cloud-Topic-c82b57aa"
      }
    },
    "aws_sns_topic_subscription": {
      "cloudTopic_cloudTopic-TopicSubscription-86898773_6DC96C29": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic/cloud.Topic-TopicSubscription-86898773",
            "uniqueId": "cloudTopic_cloudTopic-TopicSubscription-86898773_6DC96C29"
          }
        },
        "endpoint": "${aws_lambda_function.cloudTopic-OnMessage-86898773.arn}",
        "protocol": "lambda",
        "topic_arn": "${aws_sns_topic.cloudTopic.arn}"
      },
      "cloudTopic_cloudTopic-TopicSubscription-cdafee6e_A58E0350": {
        "//": {
          "metadata": {
            "path": "root/Default/Default/cloud.Topic/cloud.Topic-TopicSubscription-cdafee6e",
            "uniqueId": "cloudTopic_cloudTopic-TopicSubscription-cdafee6e_A58E0350"
          }
        },
        "endpoint": "${aws_lambda_function.cloudTopic-OnMessage-cdafee6e.arn}",
        "protocol": "lambda",
        "topic_arn": "${aws_sns_topic.cloudTopic.arn}"
      }
    }
  }
}
```

