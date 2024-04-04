# get-repo-size
A Github action to get the size of github repository in kilobytes.

## Usage
Call GitHub action with the GitHub token that has read access to the repository.
```yml
    - uses: rajhawaldar/get-repo-size@v1.0
      id: get-repo-size
      with:
        GITHUB_TOKEN: ${{secrets.MY_GITHUB_TOKEN}}
```

If the token has read access to the repository, it will return the size in kilobytes. 
```yml
    - run: echo "Repository size is $SIZE"
      shell: bash
      env:
        SIZE: ${{ steps.get-repo-size.outputs.REPO_SIZE }}
```

If the token is unable to access the repository then workflow will failed with the following error

```
Error: Not able to get repository size
```

## License

[MIT](LICENSE)
