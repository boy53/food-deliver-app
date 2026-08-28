export const r2Service = {
  getPresignedUploadUrl: async (key: string) => {
    return `https://r2.yourdomain.com/${key}`;
  },
};
