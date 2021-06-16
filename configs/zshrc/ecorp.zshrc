function run-raptor-app() {
  mvn exec:java -Dexec.mainClass="$1.RaptorApplication"
}