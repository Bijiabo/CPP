@Uploads = new FS.Collection "uploads", {
  stores: [new FS.Store.FileSystem("uploads", {path: "~/uploads"})]
}

Uploads.allow {
  insert : (userId, post)-> true
  update : (userId, post)-> true
}
