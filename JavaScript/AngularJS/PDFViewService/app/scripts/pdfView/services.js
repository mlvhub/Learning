'use strict';

angular.module('pdfViewDirective').factory('pdfService', function() {
  return {
    pdf: null,
    isLoaded: false,
    scale: 1,
    canvas: null,
    pages: 0,
    render: function(numPage) {
      if(this.isLoaded && numPage <= this.pages) {
        var self = this;
        this.pdf.getPage(parseInt(numPage)).then(function(page) {
          var viewport = page.getViewport(self.scale);

          var context = self.canvas.getContext('2d');
          self.canvas.height = viewport.height;
          self.canvas.width = viewport.width;

          page.render({canvasContext: context, viewport: viewport});
        }).catch(function(error) {
          console.log('Catch:', error);
        });
      }
    },
    load: function(url, initialPage, canvas) {
      PDFJS.disableWorker = true;
      
      var self = this;
      this.canvas = canvas;
      this.isLoaded = false;
      PDFJS.getDocument(url).then(function(pdf) {
        self.isLoaded = true;
        self.pdf = pdf;
        self.pages = pdf.numPages;
        self.render(initialPage);
      }).catch(function(error) {
        console.log('Catch:', error);
      });
    }
 };
});
