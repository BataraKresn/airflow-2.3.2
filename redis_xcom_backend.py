from airflow.models.xcom import BaseXCom
import redis
import json
import os

class RedisXComBackend(BaseXCom):
    def __init__(self):
        # Connect to Redis, using environment variables for configuration
        self.redis_client = redis.Redis(
            host=os.getenv('REDIS_HOST', 'redis'),
            port=int(os.getenv('REDIS_PORT', 6379)),
            db=int(os.getenv('REDIS_DB', 0))
        )

    @staticmethod
    def serialize_value(value):
        # Convert the value to JSON
        return json.dumps(value)

    @staticmethod
    def deserialize_value(result):
        # Convert the value back from JSON
        return json.loads(result)

    def set(self, key, value):
        # Store the value in Redis
        self.redis_client.set(key, self.serialize_value(value))

    def get(self, key):
        # Retrieve the value from Redis
        result = self.redis_client.get(key)
        if result:
            return self.deserialize_value(result)
        return None