'use strict';

angular.module('bookmarks').factory('bookmarkService', function() {
  return {
    all: function() {
      var values = [],
      keys = Object.keys(localStorage),
      i = 0;
      for (; i < keys.length; i++) {
        if(keys[i].indexOf('bookmark') !== -1) {
          var value = JSON.parse(localStorage.getItem(keys[i]));
          values.push(value);
        }
      }
      return values;
    },
  
    nextId: function() {
      var lastIdStr = localStorage.getItem('lastId'),
          lastId = (lastIdStr) ? parseInt(lastIdStr.slice(-1)) + 1 : 1;
      console.log('LastId', typeof lastId);
      return 'bookmark' + lastId;
    },

    find: function(id) {
      var bookmark = JSON.parse(localStorage.getItem(id));
      return bookmark;
    },

    findByUrl: function(url) {
      var bookmarks = this.all(),
          bookmark = bookmarks.filter(function(elem){
            console.log('Type of', url, elem.url);
            return url === elem.url;
          });
      return bookmark[0];
    },

    create: function(bookmark) {
      bookmark.id = this.nextId();
      var bookmarkJSON = JSON.stringify(bookmark);
      console.log('Creating Bookmark:', bookmarkJSON);
      localStorage.setItem(bookmark.id, bookmarkJSON);
      localStorage.setItem('lastId', bookmark.id);
    },

    update: function(bookmark) {
      var bookmarkJSON = JSON.stringify(bookmark);
      localStorage.setItem(bookmark.id, bookmarkJSON);
    },

    delete: function(id) {
      localStorage.removeItem(id);
    }

  };
});
