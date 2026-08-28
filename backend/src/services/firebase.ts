export const firebaseService = {
  sendPushNotification: async (token: string, title: string, body: string) => {
    return { success: true, messageId: 'msg-123' };
  },
};
