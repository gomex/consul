@setupApplicationTest
Feature: dc / services / show / topology / tproxy
  Background:
    Given 1 datacenter model with the value "datacenter"
    And the local datacenter is "datacenter"
    And 1 intention model from yaml
    ---
      SourceNS: default
      SourceName: web
      DestinationNS: default
      DestinationName: db
      ID: intention-id
    ---
    And 1 node model
    And 1 service model from yaml
    ---
    - Service:
        Name: web
        Kind: ~
    ---
  Scenario: Deafult allow is set to true
    Given 1 topology model from yaml
    ---
      FilteredByACLs: false
      TransparentProxy: false
      DefaultAllow: true
      WildcardIntention: false
    ---
    When I visit the service page for yaml
    ---
      dc: datacenter
      service: web
    ---
    Then the url should be /datacenter/services/web/topology
    And I see the tabs.topologyTab.defaultAllowNotice object

