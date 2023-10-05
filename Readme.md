

```
docker build -t rstudio .
docker run  -it -p 3838:3838  -p 8787:8787 -e PASSWORD=rstudio rstudio
```


