# Problems encountered during openapi --> smithy --> smithy4s conversion

Schema in use is for the interesting game [SpaceTraders](https://spacetraders.io/).

## Steps to reproduce
```shell
wget https://stoplight.io/api/v1/projects/spacetraders/spacetraders/nodes/reference/SpaceTraders.json\?fromExportButton\=true\&snapshotType\=http_service\&deref\=optimizedBundle -O openapi.json

```

You can see the openAPI in use [here](https://spacetraders.stoplight.io/docs/spacetraders).


### smithytranslate
I had trouble with all the other scala-generators for openAPI and found the smithy4s ecosystem.

```shell
mkdir -p generated
smithytranslate openapi-to-smithy --input openapi.json generated
```

First I got this error, which seems to be caused by a semantic error in the spec. Guess the maximum value is missing. I removed the field and now it works.

All the fixes are in this [commit](https://github.com/FloWi/error-with-smithy4s-generation/commit/da5ecdd10508a13485bdd702e1559b660ff22161#diff-a9865368a7fc7fa33065e35b2343f10d08fb79d65205435403d0a163a3044713).


```text
Result contained ERROR severity validation events:
[ERROR] openapi#Survey$expiration: Trait `range` cannot be applied to `openapi#Survey$expiration`. This trait may only be applied to shapes that match the following selector: :test(number, member > number) | TraitTarget N/A:0:0
```

```json
{
  "expiration": {
    "type": "string",
    "format": "date-time",
    "description": "The date and time when the survey expires. After this date and time, the survey will no longer be available for extraction.",
    "minimum": 0
  }
}
```

### smithy4s generate

```shell
mkdir spacetraders-scala
smithy4s generate --output spacetraders-scala generated
```

Now I get several errors of these types (see `smithy4s-generate-errors.log`) 
```text
Unable to resolve trait `smithytranslate#errorMessage`
Unable to resolve trait `smithytranslate#contentType`
```

Other errors came with the `@errorMessage` and `use smithytranslate#errorMessage`. I just removed them.

All the fixes are in this [commit](https://github.com/FloWi/error-with-smithy4s-generation/commit/770aecd92f322e7b5aea94e2af77d5cbb02acf57).

## Working project WIP

Here is a link to my [WIP](https://github.com/FloWi/flwi-spacetraders) using the generated client.
