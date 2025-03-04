bring fs;
bring regex;
bring expect;

let tmpdir = fs.mkdtemp();
let dirpath = "${tmpdir}/wingdir-preflight";
let filename = "temp.txt";

fs.mkdir(dirpath);
assert(fs.exists(dirpath) == true);

try {
    fs.mkdir(dirpath);
} catch e {
    assert(regex.match("^EEXIST: file already exists", e) == true);
}

fs.writeFile(fs.join(dirpath, filename), "");
let files = fs.readdir(dirpath);
assert(files.length == 1);

fs.remove(dirpath);
assert(fs.exists(dirpath) == false);

let nilFiles = fs.tryReaddir(dirpath);
assert(nilFiles == nil);

test "inflight create normal directory" {
    let tmpdir = fs.mkdtemp();
    let dirpath = "${tmpdir}/wingdir-inflight";

    fs.mkdir(dirpath);
    assert(fs.exists(dirpath) == true);

    try {
        fs.mkdir(dirpath);
    } catch e {
        assert(regex.match("^EEXIST: file already exists", e) == true);
    }
    
    fs.writeFile(fs.join(dirpath, filename), "");
    let files = fs.readdir(dirpath);
    assert(files.length == 1);

    fs.remove(dirpath);
    assert(fs.exists(dirpath) == false);

    let nilFiles = fs.tryReaddir(dirpath);
    assert(nilFiles == nil);
}

test "cannot overwrite directory with a file" {
    let tmpdir = fs.mkdtemp();
    let dirpath = "${tmpdir}/test-overwrite-dir";
    let var errorCaught = false;

    fs.mkdir(dirpath);
    assert(fs.exists(dirpath) == true);

    try {
        fs.writeFile(dirpath, "This should fail.");
    } catch e {
        errorCaught = regex.match("^EISDIR: illegal operation on a directory", e);
    }
    assert(errorCaught == true);

    // Cleanup
    fs.remove(dirpath);
    assert(fs.exists(dirpath) == false);
}

test "isDir()" {
    let tempDir = fs.mkdtemp();
    expect.equal(fs.isDir(tempDir), true);

    let tempFile = fs.join(tempDir, "tempfile.txt");
    fs.writeFile(tempFile, "Hello, Wing!");
    expect.equal(fs.isDir(tempFile), false);

    let nonExistentPath = fs.join(tempDir, "nonexistent");
    expect.equal(fs.isDir(nonExistentPath), false);

    // Cleanup
    fs.remove(tempDir);
    expect.equal(fs.exists(dirpath), false);
}
