from django.conf.urls import patterns, include, url
from views import hello

#from django.contrib import admin
#admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', hello),
)
