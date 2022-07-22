declare module "@salesforce/apex/SearchController.search" {
  export default function search(param: {objectName: any, fields: any, searchTerm: any}): Promise<any>;
}
declare module "@salesforce/apex/SearchController.getRecentlyCreatedRecord" {
  export default function getRecentlyCreatedRecord(param: {recordId: any, fields: any, objectName: any}): Promise<any>;
}
