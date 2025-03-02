# Using [atlas](https://atlasgo.io/) for creating migrations based on state

```bash
 atlas schema apply -u "postgres://admin:admin@localhost:5432/university?sslmode=disable" --to "file://./schema.sql" --dev-url "docker://postgres/latest/dev"
 ```

```bash
 atlas schema clean -u "postgres://admin:admin@localhost:5432/university?sslmode=disable"
 ```