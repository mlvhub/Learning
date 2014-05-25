'use strict';

describe('Navigation Menu', function() {
  it('changes active link depending on route', function() {
    brower.get('/');
    var activeListItem = element(by.css('.active')),
        text = activeListItem.findElement(by.tabName('a')).getText();

    expect(text)toEqual('Home');
  });
});
